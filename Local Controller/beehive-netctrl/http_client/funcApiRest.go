package http_client

import (
	"bytes"
	"encoding/json"
	"fmt"
	//"io"
	"io/ioutil"
	"log"
	"net/http"
)

type Link struct {
	ID    string `json:"ID"`
	From  string `json:"From"`
	To    string `json:"To"`
	State int    `json:"State"`
}

type Topology struct {
	Id    int
	Datos map[string][]Link
}

type Bandwidth struct {
	Id    int
	Datos string
}

type Metrics struct {
	Id   int
	Data string
}

type BestRoutes struct {
	Routes [][]int
	Ports [][]string
}

func GetBestRoutesInterDomain() {
	url := "http://192.168.101.15:8080/routes"

	resp, err := http.Get(url)
	if err != nil {
		fmt.Println("Calculing Routes Inter-Domain...")
		return
	}
	defer resp.Body.Close()

	routes := &BestRoutes{}

	err = json.NewDecoder(resp.Body).Decode(&routes)
	if err != nil {
		fmt.Println("Calculing Routes Inter-Domain...")
		return
	}

	formatJson, err := json.MarshalIndent(routes, "", " ")
	if err != nil {
		fmt.Println("err formatJson: ", err)
	}

	err = ioutil.WriteFile("/home/controller2/go/src/github.com/kandoo/beehive-netctrl/bestRoutesGlobal.json", formatJson, 0666)
	if err != nil {
		fmt.Println("err write file: ", err)
	}

	fmt.Println("Receive best routes global")
}

func GetFileRoutesGlobal(src string, dst string) (*BestRoutes, error) {
	url := fmt.Sprintf("http://192.168.101.15:8080/result/%s_%s", src, dst)

	resp, err := http.Get(url)
	if err != nil {
		return nil, err
	}
	defer resp.Body.Close()

	routes := &BestRoutes{}

	err = json.NewDecoder(resp.Body).Decode(&routes)
	if err != nil {
		return nil, err
	}

	return routes, nil
}

func SendTopology(id int) {
	file, err := ioutil.ReadFile("/home/controller2/go/src/github.com/kandoo/beehive-netctrl/topologyGlobal.json")
	if err != nil {
		fmt.Println("err1: ", err)
		log.Fatal(err)
	}

	topoSend := Topology{}

	err = json.Unmarshal(file, &topoSend.Datos)
	if err != nil {
		fmt.Println("err2: ", err)
		return
		//log.Fatal(err)
	}
	topoSend.Id = id
	_, err = saveTopology(topoSend)
	if err != nil {
		fmt.Println("err3: ", err)
		log.Fatal(err)
	}
	log.Println("Se guardo el archivo de topologia")
}

func SendBandwidth(id int) {
	file, err := ioutil.ReadFile("/home/controller2/go/src/github.com/kandoo/beehive-netctrl/bw_r_global.txt")
	if err != nil {
		fmt.Println("err4: ", err)
		log.Fatal(err)
	}

	bwSend := Bandwidth{
		Id:    id,
		Datos: string(file),
	}

	_, err = saveBandwidth(bwSend)
	if err != nil {
		fmt.Println("err5: ", err)
		log.Fatal(err)
	}
	log.Println("Se guardo el archivo de bandwidth")
}

func SendMetrics(id int) {
	file, err := ioutil.ReadFile("/home/controller2/go/src/github.com/kandoo/beehive-netctrl/net_info.csv")
	if err != nil {
		//log.Fatal(err)
		fmt.Println("No se encuentra el archivo de metricas")
		return
	}

	metricsSend := Metrics{
		Id:   id,
		Data: string(file),
	}

	_, err = saveMetrics(metricsSend)
	if err != nil {
		fmt.Println("err7: ", err)
		log.Fatal(err)
	}
	log.Println("Se guardo el archivo de metricas")
}

func saveTopology(topology Topology) (string, error) {
	url := "http://192.168.101.15:8080/topology"
	topo := &topology

	content, err := json.Marshal(topo)
	if err != nil {
		return "nil", err
	}

	resp, err := http.Post(url, "application/json", bytes.NewBuffer(content))
	if err != nil {
		return "nil", err
	}
	defer resp.Body.Close()

	//Deberia llegar el archivo respuesta del server, rutas a instalar
	bytes, err := ioutil.ReadAll(resp.Body)

	return string(bytes), err
}

func saveBandwidth(bandwidth Bandwidth) (string, error) {
	//fmt.Println("SaveBandwidth")
	url := "http://192.168.101.15:8080/bw"
	bw := &bandwidth

	content, err := json.Marshal(bw)
	if err != nil {
		return "nil", err
	}

	resp, err := http.Post(url, "text/plain", bytes.NewBuffer(content))
	if err != nil {
		return "nil", err
	}
	defer resp.Body.Close()

	//Deberia llegar el archivo respuesta del server, rutas a instalar
	bytes, err := ioutil.ReadAll(resp.Body)

	return string(bytes), err
}

func saveMetrics(metrics Metrics) (string, error) {
	url := "http://192.168.101.15:8080/metrics"
	mtrs := &metrics

	content, err := json.Marshal(mtrs)
	if err != nil {
		return "nil", err
	}
	//fmt.Println(string(content))
	resp, err := http.Post(url, "text/csv", bytes.NewBuffer(content))
	if err != nil {
		return "nil", err
	}
	defer resp.Body.Close()

	//Deberia llegar el archivo respuesta del server, rutas a instalar
	bytes, err := ioutil.ReadAll(resp.Body)

	return string(bytes), err
}
