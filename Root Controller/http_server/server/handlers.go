package server

import (
	"encoding/json"
	"fmt"
	"log"
	"net/http"
	"os"
	"strconv"
	"strings"
	//"time"
)

func index(w http.ResponseWriter, r *http.Request) {
	if r.Method != http.MethodGet {
		w.WriteHeader(http.StatusMethodNotAllowed)
		fmt.Fprintf(w, "Method not allowed")
		return
	}
	fmt.Fprintf(w, "Hello there %s", "visitor")
}

func getTopology(w http.ResponseWriter, r *http.Request) {
	log.Println("Metodo GET Topology recibido")
	w.Header().Set("Content-Type", "application/json")
	json.NewEncoder(w).Encode(topo)
}

func addTopology(w http.ResponseWriter, r *http.Request) {
	log.Println("Metodo POST Topology recibido")
	topology := &Topology{}

	err := json.NewDecoder(r.Body).Decode(topology)
	if err != nil {
		w.WriteHeader(http.StatusBadRequest)
		fmt.Println("Err Decode: ", err)
		return
	}
	topo[topology.Id] = topology

	fileName := fmt.Sprintf("topology/Topology%d.json", topology.Id)

	formatJson, err := json.MarshalIndent(topology.Datos, "", " ")
	if err != nil {
		log.Fatal(err)
	}

	err = os.WriteFile(fileName, formatJson, 0666)
	if err != nil {
		log.Fatal(err)
	}

	fmt.Fprintf(w, "Topology was added")
}

func getBw(w http.ResponseWriter, r *http.Request) {
	log.Println("Metodo GET Bandwidth recibido")
	w.Header().Set("Content-Type", "text/plain")
	json.NewEncoder(w).Encode(bw)
}

func addBw(w http.ResponseWriter, r *http.Request) {
	log.Println("Metodo POST Bandwidth recibido")
	bwd := &Bandwidth{}

	// Decodifica la informacion que llega a la ruta del servidor
	err := json.NewDecoder(r.Body).Decode(bwd)
	if err != nil {
		w.WriteHeader(http.StatusBadRequest)
		fmt.Println("Err Decode: ", err)
		return
	}

	bw[bwd.Id] = bwd

	fileName := fmt.Sprintf("bandwidth/bw_total%d.txt", bwd.Id)

	content, err := json.Marshal(bw[bwd.Id].Datos)
	if err != nil {
		log.Fatal(err)
	}

	//Quitamos comillas y saltos de linea para evitar errores en el archivo txt
	text := string(content)
	text = strings.ReplaceAll(text, "\"", "")
	text = strings.ReplaceAll(text, "\\n", "\n")

	//Escribimos el archivo .txt que almacena los anchos de banda de la red
	err = os.WriteFile(fileName, []byte(text), 0666)
	if err != nil {
		log.Fatal(err)
	}

	fmt.Fprintf(w, "Bandwidth was added")
}

func getMetrics(w http.ResponseWriter, r *http.Request) {
	log.Println("Metodo GET Metrics recibido")
	w.Header().Set("Content-Type", "text/csv")
	json.NewEncoder(w).Encode(mtrs)
}

func addMetrics(w http.ResponseWriter, r *http.Request) {
	log.Println("Metodo POST Metrics recibido")
	mt := &Metrics{}

	// Decodifica la informacion que llega a la ruta del servidor
	err := json.NewDecoder(r.Body).Decode(mt)
	if err != nil {
		w.WriteHeader(http.StatusBadRequest)
		fmt.Println("Err Decode: ", err)
		return
	}

	mtrs[mt.Id] = mt

	fileName := fmt.Sprintf("metrics/net_info%d.csv", mt.Id)

	content, err := json.Marshal(mtrs[mt.Id].Data)
	if err != nil {
		log.Fatal(err)
	}

	//Quitamos comillas y saltos de linea para evitar errores en el archivo txt
	text := string(content)
	text = strings.ReplaceAll(text, "\"", "")
	text = strings.ReplaceAll(text, "\\n", "\n")

	//Escribimos el archivo .txt que almacena los anchos de banda de la red
	err = os.WriteFile(fileName, []byte(text), 0666)
	if err != nil {
		log.Fatal(err)
	}

	fmt.Fprintf(w, "Metrics was added")
}

func getRouteGlobal(w http.ResponseWriter, r *http.Request) {
	log.Println("Metodo GET Route Global recibido")

	content, err := os.ReadFile("/home/kandoo18/Documentos/http_server/bestRoutes.json")
	if err != nil {
		return
	}

	routes := BestRoutes{}

	err = json.Unmarshal(content, &routes.Routes)
	if err != nil {
		log.Fatal(err)
	}

	contentLinks, err := os.ReadFile("/home/kandoo18/Documentos/http_server/totalData/totalTopology.json")
	if err != nil {
		log.Fatal("err3", err)
	}

	topo := Topology{}

	err = json.Unmarshal(contentLinks, &topo.Datos)
	if err != nil {
		log.Fatal("err4", err)
	}

	arrPorts := [][]string{}
	for _, ak := range routes.Routes {
		arrPortst := []string{}
		for i := 0; i < len(ak)-1; i++ {
			for _, l1 := range topo.Datos {
				for _, l2 := range l1 {
					from := strings.Split(l2.From, "$$")
					fromInt, _ := strconv.Atoi(from[0])
					to := strings.Split(l2.To, "$$")
					toInt, _ := strconv.Atoi(to[0])
					if ak[i] == fromInt && ak[i+1] == toInt {
						arrPortst = append(arrPortst, l2.From)
					}
				}
			}
		}
		arrPorts = append(arrPorts, arrPortst)
	}
	routes.Ports = arrPorts

	w.Header().Set("Content-Type", "application/json")
	json.NewEncoder(w).Encode(routes)
}

func getResult(w http.ResponseWriter, r *http.Request, id string) {
	log.Println("Metodo GET Result recibido")
	//timeStart := time.Now()
	for {
		var banError bool = false
		content, err := os.ReadFile("/home/kandoo18/Documentos/http_server/bestRoutes.json")
		if err != nil {
			return
		}

		routes := BestRoutes{}

		err = json.Unmarshal(content, &routes.Routes)
		if err != nil {
			banError = true
		}
		if !banError {
			contentLinks, err := os.ReadFile("/home/kandoo18/Documentos/http_server/totalData/totalTopology.json")
			if err != nil {
				log.Fatal("err3", err)
			}

			topo := Topology{}

			err = json.Unmarshal(contentLinks, &topo.Datos)
			if err != nil {
				banError = true
			}

			if !banError {
				substring := strings.Split(id, "_")
				arrNodes := []int{}
				for _, substr := range substring {
					num, err := strconv.Atoi(substr)
					if err == nil {
						arrNodes = append(arrNodes, num)
					}
				}

				arrRoutes := [][]int{}
				for _, rou := range routes.Routes {
					if rou[0] == arrNodes[0] && rou[len(rou)-1] == arrNodes[1] {
						arrRoutes = append(arrRoutes, rou)
					}
				}

				arrPorts := [][]string{}
				arrPorts1 := []string{}
				for _, ak := range arrRoutes {
					for i := 0; i < len(ak)-1; i++ {
						for _, l1 := range topo.Datos {
							for _, l2 := range l1 {
								from := strings.Split(l2.From, "$$")
								fromInt, _ := strconv.Atoi(from[0])
								to := strings.Split(l2.To, "$$")
								toInt, _ := strconv.Atoi(to[0])
								if ak[i] == fromInt && ak[i+1] == toInt {
									arrPorts1 = append(arrPorts1, l2.From)
								}
							}
						}
					}
					arrPorts = append(arrPorts, arrPorts1)
				}

				send := BestRoutes{
					Routes: arrRoutes,
					Ports:  arrPorts,
				}
				
				w.Header().Set("Content-Type", "application/json")
				err = json.NewEncoder(w).Encode(send)
				if err != nil {
					log.Fatal("err7", err)
				}
				break
			}
		}
	}
	//elapsed := time.Since(timeStart)
	//fmt.Println("Tiempo en bestRoute: ", elapsed)
}
