package kandoo

import (
	"bytes"
	"fmt"

	//"bytes"
	"strconv"
	//"container/heap"
	"encoding/binary"
	"encoding/json"
	"io"
	"io/ioutil"
	"net"
	"os"
	"os/exec"
	"strings"
	"time"

	bh "github.com/kandoo/beehive"
	"github.com/kandoo/beehive-netctrl/nom"
	"github.com/kandoo/beehive-netctrl/openflow/of13"
	"github.com/kandoo/beehive/Godeps/_workspace/src/github.com/golang/glog"
)

var routes = make(map[int][]nom.Link)
var arrRoutes = [][]int{}
var rr = [][]int{}
var portBlock = [][]nom.UID{}
var numPorts [2]int

const BUFFERSIZE = 1024

type ShortestpathRcv struct {
	Local
}

// La funcion containsRoute verifica si el slice arrLinks contiene el link suministrado
func containsRoute(arrLinks []nom.Link, findLink nom.Link) bool {
	for _, v := range arrLinks {
		if v == findLink {
			return true
		}
	}
	return false
}

func fillSTPArr(links map[nom.UID]*[]nom.Link, arrZero [][]int, arrIntf [][]nom.Link) {
	for i := 1; i <= len(links); i++ {
		for k := 1; k <= len(links); k++ {
			for _, fi := range *links[nom.UID(strconv.Itoa(i))] {
				nodeTo, _ := nom.ParsePortUID(fi.To)
				nodeFrom, _ := nom.ParsePortUID(fi.From)
				nodeFromInt, _ := strconv.Atoi(string(nodeFrom))
				nodeToInt, _ := strconv.Atoi(string(nodeTo))
				arrZero[nodeFromInt-1][nodeToInt-1] = 1
				arrIntf[nodeFromInt-1][nodeToInt-1] = fi
			}
		}
	}
}

func existNodePort(arr []nom.UID, portUID nom.UID) bool {
	for _, red := range arr {
		if red == portUID {
			return true
		}
	}
	return false
}

func numPuertos(ports map[nom.UID]*[]nom.Port) int {
	var cont int = 0
	for _, arrP := range ports {
		for k := range *arrP {
			glog.Info("Numero de puertos: ", k)
			cont++
		}
	}
	return cont
}

func (d ShortestpathRcv) Rcv(msg bh.Msg, ctx bh.RcvContext) error {
	fmt.Println("Entra a ShortestPath")
	l := msg.Data().(nom.ShortestpathLinks)

	file, _ := json.MarshalIndent(l.Lks, "", "\t")
	_ = ioutil.WriteFile("topologyTest.json", file, 0644)

	portsLoop := []nom.UID{}
	arrLinksLoop := []nom.Link{}
	arrZero := make([][]int, len(l.Lks))
	arrIntf := make([][]nom.Link, len(l.Lks))
	//var cont1 int = 0
	var cont2 int = 0

	//Para saber el numero ed puertos de la topologia
	numPorts[0] = numPuertos(l.Ports)

	// Llena los arrays vacion con ceros [[0 0 0][0 0 0]...] o [[{0}{0}{0}]...]
	for g := 0; g < len(l.Lks); g++ {
		arrZero[g] = make([]int, len(l.Lks))
		arrIntf[g] = make([]nom.Link, len(l.Lks))
	}

	// Llena arrZero y arrIntf co los valores de la topologia
	fillSTPArr(l.Lks, arrZero, arrIntf)

	// Se utiliza un algoritmo STP que recibe un array y
	//nos retorna un array sin los caminos redudantes
	mst := findMST(arrZero, 0)

	//Compara los arreglos arrZero y arrIntf para sacar los links redundantes
	//y los guarda en el array arrLinksLoop
	for i, row := range mst {
		for k, dat := range row {
			state := int(arrIntf[i][k].State)
			if dat != state {
				arrLinksLoop = append(arrLinksLoop, arrIntf[i][k])
			}
		}
	}

	//Solo para ver los puertos (se puede eliminar)
	/*for _, ad := range l.Ports {
		fmt.Println("ad: ", ad)
	}*/

	//Comparar para ver que puerto se bloquea
	for _, linkloop := range arrLinksLoop {
		if linkloop.State == nom.LinkState(1) {
			portFrom := nom.Port{}
			portTo := nom.Port{}
			nF, pF := nom.ParsePortUID(linkloop.From)
			nT, pT := nom.ParsePortUID(linkloop.To)
			for _, p_f := range *l.Ports[nom.UID(nF)] {
				if pF == p_f.ID {
					portFrom = p_f
				}
			}
			for _, p_t := range *l.Ports[nom.UID(nT)] {
				if pT == p_t.ID {
					portTo = p_t
				}
			}

			//Comparamos las dos MACs
			if !portFrom.MACAddr.Less(portTo.MACAddr) {
				changeState := nom.PortStatusChanged{
					Port: nom.Port{
						ID:      portFrom.ID,
						Name:    portFrom.Name,
						MACAddr: portFrom.MACAddr,
						Node:    portFrom.Node,
						State:   nom.PortState(of13.PPC_NO_ALL),
						Config:  nom.PortConfig(of13.PPC_NO_FWD_PACKET_IN),
					},
					Driver: l.Driver[portFrom.Node],
				}
				portsLoop = append(portsLoop, nom.ParseUIDPort(nom.NodeID(portFrom.Node), portFrom.ID))
				//fmt.Println("chport: ", changeState)
				ctx.SendToBee(changeState, l.Driver[portFrom.Node].BeeID)
				cont2++
				arrBlock := []nom.UID{portFrom.Node, nom.UID(portFrom.ID)}
				portBlock = append(portBlock, arrBlock)
				fmt.Printf("Port Blocking %s$$%s\n", portFrom.Node, portFrom.ID)
			}
		}
	}
	numPorts[1] = cont2

	//Se elimina las reglas DROP de los flujos no redundantes
	for _, fir := range arrIntf {
		for _, sec := range fir {
			if sec.State == nom.LinkState(1) {
				if !existNodePort(portsLoop, sec.From) {
					nod := nom.UID(nom.ParseNodeUID(sec.From))
					delFlowDrop := nom.DelFlowEntry{
						Match: nom.Match{
							Fields: []nom.Field{
								nom.InPort(sec.From),
							},
						},
						Exact: false,
					}
					ctx.SendToBee(delFlowDrop, l.Driver[nod].BeeID)
					//fmt.Println("Del: ", delFlowDrop, nod)
				}
			}
		}
	}

	//solo servira para un host por switch
	for p := 1; p <= len(l.Lks); p++ {
		inPortO := nom.ParseUIDPort(nom.NodeID(strconv.Itoa(p)), nom.PortID(strconv.Itoa(1)))
		nod := nom.UID(strconv.Itoa(p))
		delFlowDrop := nom.DelFlowEntry{
			Match: nom.Match{
				Fields: []nom.Field{
					nom.InPort(inPortO),
				},
			},
			Exact: false,
		}
		//fmt.Println("Del: ", delFlowDrop, nod)
		ctx.SendToBee(delFlowDrop, l.Driver[nod].BeeID)
	}

	links := nom.LinksToController{
		//Links:     l.Lks,
		NumPorts:  numPorts[:],
		PortBlock: portBlock,
	}
	ctx.Emit(links)

	fmt.Println("Port Blocking Completion ", numPorts)
	/*ctx.Emit(nom.ResultCont{
		Links: l.Lks,
		Port:  l.Ports,
		Drive: l.Driver,
	})


		file, _ := json.MarshalIndent(l.Lks, "", "\t")
		_ = ioutil.WriteFile("topologyTest.json", file, 0644)

		for contF := 1; contF <= len(l.Lks); contF++ {
			fmt.Println("Links: ", l.Lks[nom.UID(strconv.Itoa(contF))])
			for contT := 1; contT <= len(l.Lks); contT++ {
				if contF != contT {
					n_from := nom.UID(strconv.Itoa(contF))
					n_To := nom.UID(strconv.Itoa(contT))
					path, _ := discovery.ShortestPathCentralized1(n_from, n_To, l.Lks)

					var pathSmall []nom.Link

					first := len(path[0])
					pathSmall = path[0]

					for _, link := range path {
						fm, _ := nom.ParsePortUID(link[0].From)
						if fm == nom.NodeID(strconv.Itoa(contF)) {
							if len(link) < first {
								first = len(link)
								pathSmall = link
							}
						}
					}

					var nodeRoute = []nom.UID{}
					//Podria meter esto en una funcion, guarda los links en u formato comparable con los de dikstra
					for _, dataLink := range pathSmall {
						f_link, _, t_link := nom.ParseLinkUID(dataLink.UID())
						//fmt.Println("f_link: ", f_link, " t_link: ", t_link, " dataLink: ", dataLink)
						if len(nodeRoute) == 0 {
							nodeRoute = append(nodeRoute, f_link.UID(), nom.UID(t_link))
						} else if nodeRoute[len(nodeRoute)-1] == f_link.UID() {
							nodeRoute = append(nodeRoute, nom.UID(t_link))
						}
					}

					arrRoutes = append(arrRoutes, nodeRoute)

					//fmt.Println("From ", n_from, " To ", n_To, " --> Actions: ", pathSmall[0])
					if containsRoute(routes[contF], pathSmall[0]) {
						fmt.Print(".")
					} else {
						routes[contF] = append(routes[contF], pathSmall[0])
					}

					add := nom.AddFlowEntry{
						Flow: nom.FlowEntry{
							Node: n_from,
							Match: nom.Match{
								Fields: []nom.Field{
									nom.EthDst{
										Addr: l.Hosts[contT].MAC,
										Mask: nom.MaskNoneMAC,
									},
									nom.EthSrc{
										Addr: l.Hosts[contF].MAC,
										Mask: nom.MaskNoneMAC,
									},
									//nom.EthType(nom.EthTypeARP),
								},
							},
							Actions: []nom.Action{
								nom.ActionForward{
									Ports: []nom.UID{pathSmall[0].From},
								},
							},
						},
					}

					/*addARP := nom.AddFlowEntry{
						Flow: nom.FlowEntry{
							Node: n_from,
							Match: nom.Match{
								Fields: []nom.Field{
									nom.EthDst{
										Addr: l.Hosts[contT].MAC,
										Mask: nom.MaskNoneMAC,
									},
									nom.EthType(nom.EthTypeARP),
								},
							},
							Actions: []nom.Action{
								nom.ActionForward{
									Ports: []nom.UID{pathSmall[0].From},
								},
							},
						},
					}
					fmt.Println("Emitiendo: ", addARP.Flow, " - ", add)
					xd := nom.Port{
						Node:  n_from,
						MACAddr: l.,
						State: nom.PortStateBlocked,
					}

					xd2 := nom.PortStatusChanged{
						Port:   xd,
						Driver: l.Driver[n_from],
					}

					dictNode := ctx.Dict(node)
					fmt.Println("xd2: ", xd2)
					ctx.SendToBee(xd2, l.Driver[n_from].BeeID)
					ctx.Emit(add)
					//ctx.Emit(addARP)
				}
			}
			//time.Sleep(1*time.Second)
		}

		/*
			for _, d := range routes {
				fmt.Println("Routes: ", d)
			}
			fmt.Println("arrRoutes: ", arrRoutes)


		for i, hostloop := range l.Hosts {
			add2 := nom.AddFlowEntry{
				Flow: nom.FlowEntry{
					Node: hostloop.NodeTopo,
					Match: nom.Match{
						Fields: []nom.Field{
							nom.EthDst{
								Addr: hostloop.MAC,
								Mask: nom.MaskNoneMAC,
							},
							nom.EthSrc{
								Addr: hostloop.MAC,
								Mask: nom.MaskNoneMAC,
							},
						},
					},
					Actions: []nom.Action{
						nom.ActionForward{
							Ports: []nom.UID{nom.UIDJoin(strconv.Itoa(i), "1")},
						},
					},
				},
			}
			/*
				add2ARP := nom.AddFlowEntry{
					Flow: nom.FlowEntry{
						Node: hostloop.NodeTopo,
						Match: nom.Match{
							Fields: []nom.Field{
								nom.EthDst{
									Addr: hostloop.MAC,
									Mask: nom.MaskNoneMAC,
								},
								nom.EthType(nom.EthTypeARP),
							},
						},
						Actions: []nom.Action{
							nom.ActionForward{
								Ports: []nom.UID{nom.UIDJoin(strconv.Itoa(i), "1")},
							},
						},
					},
				}

				fmt.Println("Emitiendo: ", add2ARP.Flow, " - ", add2.Flow)
			ctx.Emit(add2)
			//ctx.Emit(add2ARP)
		}
		fmt.Println("----> Tablas de Flujo Llenas <-----")
	*/

	return nil
}

type GetDataDijkstra struct {
	Local
}

func (d GetDataDijkstra) Rcv(msg bh.Msg, ctx bh.RcvContext) error {
	connection, err := net.Dial("tcp", "192.168.101.7:7777")
	if err != nil {
		panic(err)
	}
	defer connection.Close()
	fmt.Println("Connected to server, start receiving the file name and file size")
	bufferFileName := make([]byte, 64)
	bufferFileSize := make([]byte, 10)

	connection.Read(bufferFileSize)
	fileSize, _ := strconv.ParseInt(strings.Trim(string(bufferFileSize), ":"), 10, 64)

	connection.Read(bufferFileName)
	fileName := strings.Trim(string(bufferFileName), ":")

	newFile, err := os.Create(fileName)

	if err != nil {
		panic(err)
	}
	defer newFile.Close()
	var receivedBytes int64

	for {
		if (fileSize - receivedBytes) < BUFFERSIZE {
			io.CopyN(newFile, connection, (fileSize - receivedBytes))
			connection.Read(make([]byte, (receivedBytes+BUFFERSIZE)-fileSize))
			break
		}
		io.CopyN(newFile, connection, BUFFERSIZE)
		receivedBytes += BUFFERSIZE
	}
	fmt.Println("Received file completely!")
	ctx.Emit(nom.Qlearning{})
	return nil
}

type iqrsmr struct {
	Local
}

func (d iqrsmr) Rcv(msg bh.Msg, ctx bh.RcvContext) error {
	var flag bool
	var actionSend nom.Link
	lik := msg.Data().(nom.ResultCont)

	linksAlgorithm := make(map[nom.UID][]nom.Link)
	for ki, bh := range lik.Links {
		for _, bk := range *bh {
			linksAlgorithm[ki] = append(linksAlgorithm[ki], bk)
		}
	}

	for _, lkr := range lik.NodoRedundante {
		nRed, _ := nom.ParsePortUID(lkr.From)
		slicered := linksAlgorithm[nom.UID(nRed)]
		for i, lkr2 := range slicered {
			if lkr2 == lkr {
				as := slicered[:i]
				ad := slicered[i+1:]
				slicered = append(as, ad...)
				linksAlgorithm[nom.UID(nRed)] = slicered
				break
			}
		}
	}

	file, err1 := json.MarshalIndent(linksAlgorithm, "", "\t")
	if err1 != nil {
		fmt.Println("Error MarshalIdent, ", err1)
	}

	err2 := ioutil.WriteFile("/home/controller2/go/src/github.com/kandoo/beehive-netctrl/topologyTest.json", file, 0644)
	if err2 != nil {
		fmt.Println("Error Write topology test, ", err2)
	}

	plan, errRead := ioutil.ReadFile("dijkstra_all.json")
	if errRead != nil {
		return nil
	}

	var data = [][]int{}
	err := json.Unmarshal(plan, &data)
	if err != nil {
		fmt.Println("Cannot unmareshal the json ", err)
	}
	
	for i, dataDijkstra := range data {
		for c, idDijkstra := range dataDijkstra {
			if len(arrRoutes) != 0 {
				if idDijkstra == arrRoutes[i][c] {
					flag = true
				} else {
					flag = false
					break
				}
			} else {
				flag = false
			}
		}

		if !flag {
			fmt.Print(dataDijkstra, " ... ")
			if len(arrRoutes) == 0 {
				rr = append(rr, dataDijkstra)
			} else {
				rr[i] = dataDijkstra
			}
			for c, idDijkstra := range dataDijkstra {
				if idDijkstra != dataDijkstra[len(dataDijkstra)-1] {
					for _, linkR := range linksAlgorithm[nom.UID(strconv.Itoa(idDijkstra))] {
						_, _, to_node := nom.ParseLinkUID(linkR.UID())
						if to_node == nom.LinkID(strconv.Itoa(dataDijkstra[c+1])) {
							actionSend = linkR
						}
					}

					var dstByte byte
					decimalNumber, _ := strconv.ParseInt(strconv.Itoa(dataDijkstra[len(dataDijkstra)-1]), 16, 64)
					dstByte = byte(decimalNumber)

					addFlow := nom.AddFlowEntry{
						Flow: nom.FlowEntry{
							Node: nom.UID(strconv.Itoa(idDijkstra)),
							Match: nom.Match{
								Fields: []nom.Field{
									nom.EthDst{
										Addr: nom.MACAddr{0, 0, 0, 0, 0, dstByte},
										Mask: nom.MaskNoneMAC,
									},
								},
							},
							Priority: 100,
							Actions: []nom.Action{
								nom.ActionForward{
									Ports: []nom.UID{actionSend.From},
								},
							},
						},
					}
					ctx.Emit(addFlow)
				}
			}
		}
	}
	
	arrRoutes = rr
	numPorts[0] = numPuertos(lik.Port)
	numPorts[1] = 0

	links := nom.LinksToController{
		Links:    linksAlgorithm,
		NumPorts: numPorts[:],
		NodoRed: lik.NodoRedundante,
	}
	ctx.Emit(links)
	return nil
}

type uniQLearning struct {
	Local
}

func (d uniQLearning) Rcv(msg bh.Msg, ctx bh.RcvContext) error {
	var flag bool
	var actionSend nom.Link
	fmt.Println("Entra a algoritmo Uni Q Learning")

	dta := msg.Data().(nom.Qlearning)

	file, err1 := json.MarshalIndent(dta.Links, "", "\t")
	if err1 != nil {
		fmt.Println("Error MarshalIdent, ", err1)
	}
	err2 := ioutil.WriteFile("topologyTest.json", file, 0644)
	if err2 != nil {
		fmt.Println("Error Write topology test, ", err2)
	}

	start := time.Now()
	cmd := exec.Command("python", "/home/kandoo18/goTest/src/github.com/kandoo/beehive-netctrl/uni_q_learning.py")
	var stdout, stderr bytes.Buffer
	cmd.Stdout = &stdout
	cmd.Stderr = &stderr

	if err := cmd.Run(); err != nil {
		fmt.Println("error: ", err)
		fmt.Println("stdout: ", stdout.String())
		fmt.Println("stderr: ", stderr.String())
	}
	elapsed := time.Since(start)
	fmt.Println("¡File unique Q Learnig created in ", elapsed, " seconds!")

	plan, _ := ioutil.ReadFile("data_uni_q.json")
	var data = [][]int{}
	err := json.Unmarshal(plan, &data)
	if err != nil {
		fmt.Println("Cannot unmareshal the json ", err)
	}

	var newData [][]int
	for _, subArr := range data {
		if len(subArr) > 1 {
			newData = append(newData, subArr)
		}
	}

	fmt.Println("arrRoutesStart: ", arrRoutes)
	fmt.Println("dataAlgorithm: ", newData)
	for i, dataDijkstra := range newData {

		for c, idDijkstra := range dataDijkstra {
			if len(arrRoutes) != 0 {
				if idDijkstra == arrRoutes[i][c] {
					flag = true
				} else {
					flag = false
					break
				}
			} else {
				flag = false
			}
		}

		if !flag {
			fmt.Println(dataDijkstra, " no es igual")
			if len(arrRoutes) == 0 {
				rr = append(rr, dataDijkstra)
			} else {
				rr[i] = dataDijkstra
			}
			for c, idDijkstra := range dataDijkstra {
				if idDijkstra != dataDijkstra[len(dataDijkstra)-1] {
					for _, linkR := range *dta.Links[nom.UID(strconv.Itoa(idDijkstra))] {
						_, _, to_node := nom.ParseLinkUID(linkR.UID())
						if to_node == nom.LinkID(strconv.Itoa(dataDijkstra[c+1])) {
							actionSend = linkR
						}
					}

					ss := make([]byte, 4)
					binary.LittleEndian.PutUint32(ss, uint32(dataDijkstra[len(dataDijkstra)-1]))

					add2 := nom.AddFlowEntry{
						Flow: nom.FlowEntry{
							Node: nom.UID(strconv.Itoa(idDijkstra)),
							Match: nom.Match{
								Fields: []nom.Field{
									nom.EthDst{
										Addr: nom.MACAddr{0, 0, 0, 0, 0, ss[0]},
										Mask: nom.MaskNoneMAC,
									},
								},
							},
							Actions: []nom.Action{
								nom.ActionForward{
									Ports: []nom.UID{actionSend.From},
								},
							},
						},
					}
					ctx.Emit(add2)
				}
			}
		}

	}
	arrRoutes = rr
	numPorts[0] = numPuertos(dta.Port)
	numPorts[1] = 0

	links := nom.LinksToController{
		//Links:    dta.Links,
		NumPorts: numPorts[:],
	}
	ctx.Emit(links)
	return nil
}
