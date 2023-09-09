package main

import (
	"context"
	"fmt"
	"http_server/server"
	"log"
	"os"
	"os/exec"
	"os/signal"
	"strings"
	"syscall"
	"time"
	"encoding/json"
)

var controllerRoot string
var errorServer bool = false
var cont int = 0

type BestRoutes struct {
	Routes [][]int
	Ports  [][]string
}

func main() {
	ctx := context.Background()

	serverDoneChan := make(chan os.Signal, 1)

	signal.Notify(serverDoneChan, os.Interrupt, syscall.SIGTERM)

	//Valor de controlador por defecto
	controllerRoot = "127.0.0.1:8080"
		
	for _, arg := range os.Args[1:] {
		opcion := strings.Split(arg, "=")
		if opcion[0] == "--controllerRoot" {
			controllerRoot = opcion[1]
		} else {
			fmt.Printf("Option %s is not valid\n", opcion[0])
			errorServer = true
		}
	}

	if !errorServer {
		srv := server.New(controllerRoot)

		go func() {
			err := srv.ListenAndServe()
			if err != nil {
				log.Println(err)
			}
		}()
		log.Println("Server started in ", controllerRoot)
		time.Sleep(time.Duration(30 * time.Second))
		go algorithmBest(serverDoneChan)

		<-serverDoneChan

		srv.Shutdown(ctx)
		log.Println("Server stopped in ", controllerRoot)
	} else {
		fmt.Println("Error running Server")
	}
}

func algorithmBest(stopChan chan os.Signal) {
	ticker := time.NewTicker(15 * time.Second)
	defer ticker.Stop()
	for {
		select {
		case <-ticker.C:
			//timeStart := time.Now()
			fmt.Println("Processing Network Topology Information...")
			//Datos globales
			server.GlobalBandwidth()
			server.GlobalTopology()
			server.GlobalMetrics()

			fmt.Println("Execute IQRSMR Algorithm...")
			cmd := exec.Command("python", "/home/kandoo18/Documentos/http_server/q-multi.py")
			if err := cmd.Run(); err != nil {
				fmt.Println("Error en cmd: ", err)
			}
			fmt.Println("File IQRSMR created in Root Controller!")
			//elapsed := time.Since(timeStart)
			//fmt.Println("Tiempo en Algoritmo: ", elapsed)

			contentLinks, err := os.ReadFile("/home/kandoo18/Documentos/http_server/bestRoutes.json")
			if err != nil {
				log.Fatal("err3", err)
			}

			topo := BestRoutes{}

			err = json.Unmarshal(contentLinks, &topo.Routes)
			if err != nil {
				log.Fatal("err4", err)
			}

			out, err := json.MarshalIndent(topo, "", " ")
			if err != nil {
				log.Fatal("err5", err)
			}
			
			ruta := fmt.Sprintf("/home/kandoo18/Documentos/http_server/rutas/bestRoute%d.json", cont)
			err = os.WriteFile(ruta, out, 0664)
			if err != nil {
				log.Fatal("err6", err)
			}
			cont+=1

		case <-stopChan:
			return
		}
	}
}
