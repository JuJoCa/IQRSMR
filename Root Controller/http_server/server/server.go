package server

import (
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
	Ports  [][]string
}

type Port struct {
	ID      string
	Name    string
	MACAddr [6]byte
	Node    string
	Link    string
	State   uint8
	Config  uint8
	Feature uint8
}

type LinkAndPorts struct {
	Ports map[string][]Port
}

// El numero es para saber el numero maximo de topologia que se van a guardar
// Por ejemplo: Con 3 se guandan topologia con id 0, 1, 2. Esto se hace con el
// fin de identificar la topologia de cada domino hecho en mininet.

var topo [3]*Topology = [3]*Topology{}
var bw [3]*Bandwidth = [3]*Bandwidth{}
var mtrs [3]*Metrics = [3]*Metrics{}

func New(addr string) *http.Server {
	initRoutes()
	return &http.Server{
		Addr: addr,
	}
}
