package controller

import (
	//"fmt"
	"bufio"
	"encoding/csv"
	"fmt"
	"log"
	"math"
	"os"
	"sort"
	"strconv"
	"strings"
	"time"
	"io/ioutil"
	"encoding/json"
	"sync"

	"github.com/kandoo/beehive/Godeps/_workspace/src/github.com/golang/glog"

	bh "github.com/kandoo/beehive"
	http "github.com/kandoo/beehive-netctrl/http_client"
	"github.com/kandoo/beehive-netctrl/config"
	"github.com/kandoo/beehive-netctrl/nom"
	"github.com/kandoo/beehive-netctrl/openflow/of13"
)

const (
	MaxPings = 10
	dictPS   = "dictPS"
)

var (
	n             int = 0
	stats             = make(map[string]map[string]nom.PortStatsQueryResult)
	arrn              = make(map[nom.UID]nom.UID)
	period        int = 0
	period2       int = 0
	period3       int = 0
	dictPortStats     = make(map[string][]nom.PortStats)
	dictPortSpeed     = make(map[string][]float64)
	pre           uint64
	periodP       float64
	tmp           []nom.PortStats
	freeBandwidth = make(map[nom.NodeID]map[nom.PortID]float64)
	portFeatures  = make(map[nom.NodeID]map[nom.PortID][]float64)

	flowStats = make(map[nom.UID]map[string][]nom.FlowStats)
	flowSpeed = make(map[nom.UID]map[string][]float64)
	tmpFlow   []nom.FlowStats

	portLoss = make(map[string]map[string][]lossPortStats)
	linkLoss = make(map[string]float64)

	linkFreeBw = make(map[string]float64)
	linkUsedBw = make(map[string]float64)

	netInfo    = make(map[string][]string)
	netMetrics = make(map[string][]string)

	contMonitor int = 0
	arrKey          = []string{}

	arrRoutes = [][]int{}
	rr = [][]int{}
)

var mutexSpeed = &sync.Mutex{}
var mutexPortStats = &sync.Mutex{}
var mutexPortLoss = &sync.Mutex{}
var mutexData = &sync.Mutex{}

func saveStatsFlow(dict map[string][]nom.FlowStats, key string, stat nom.FlowStats, limit int) {
	dict[key] = append(dict[key], stat)

	if len(dict[key]) > limit {
		dict[key] = dict[key][1:]
	}

}

func saveSpeedFlow(dict map[string][]float64, key string, speed float64, limit int) {
	dict[key] = append(dict[key], speed)

	if len(dict[key]) > limit {
		dict[key] = dict[key][1:]
	}

}

type Consolidator struct{}

func (c Consolidator) Rcv(msg bh.Msg, ctx bh.RcvContext) error {
	res := msg.Data().(nom.FlowStatsQueryResult)

	var nf nodeFlows
	if v, err := ctx.Dict(flowsDict).Get(string(res.Node)); err == nil {
		nf = v.(nodeFlows)
	}
	var nt nodeTriggers
	if v, err := ctx.Dict(triggersDict).Get(string(res.Node)); err == nil {
		nt = v.(nodeTriggers)
	}
	found := false
	matchedFlows := make(map[int]struct{})
	for _, stat := range res.Stats {
		for i := range nf.Flows {

			if nf.Flows[i].FlowEntry.Match.Equals(stat.Match) {
				found = true
				matchedFlows[i] = struct{}{}
				nf.Flows[i].updateStats(stat)
			}
		}
		if !found {
			nf.Flows = append(nf.Flows, flow{
				FlowEntry: nom.FlowEntry{
					Match: stat.Match,
				},
				Duration:     stat.Duration,
				DurationNsec: stat.DurationNsec,
				Packets:      stat.Packets,
				Bytes:        stat.Bytes,
			})
		}

		for _, t := range nt.Triggers {
			if t.Fired(stat) {
				dur := time.Duration(stat.Duration)*time.Second + time.Duration(stat.DurationNsec)
				triggered := newTriggered(t, dur, stat.BW())
				sub := t.Subscriber
				if !sub.IsNil() {
					ctx.SendToCell(triggered, sub.App, sub.Cell())
				}
			}
		}
	}

	count := 0
	for i, f := range nf.Flows {
		if _, ok := matchedFlows[i]; ok {
			continue
		}

		i -= count
		nf.Flows = append(nf.Flows[:i], nf.Flows[i+1:]...)
		count++
		del := nom.FlowEntryDeleted{
			Flow: f.FlowEntry,
		}
		ctx.Emit(del)
		for _, sub := range f.FlowSubscribers {
			if !sub.IsNil() {
				ctx.SendToCell(del, sub.App, sub.Cell())
			}
		}
	}

	for _, stat := range res.Stats {
		src, _ := stat.Match.EthSrc()
		dst, _ := stat.Match.EthDst()
		key := src.Addr.String() + "$$" + dst.Addr.String()
		if _, ok := flowStats[res.Node]; !ok {
			flowStats[res.Node] = make(map[string][]nom.FlowStats)
		}
		saveStatsFlow(flowStats[res.Node], key, stat, 5)

		// Calcule Flow Bit Rate
		pre = 0
		periodP = float64(config.MONITOR_PERIOD)
		tmpFlow = flowStats[res.Node][key]
		if len(tmpFlow) > 1 {
			long := len(tmpFlow)
			pre = tmpFlow[long-2].Bytes
			periodP = getPeriod(tmpFlow[long-1].Duration, tmpFlow[long-1].DurationNsec, tmpFlow[long-2].Duration, tmpFlow[long-2].DurationNsec)
		}
		speed := getSpeed(flowStats[res.Node][key][len(tmpFlow)-1].Bytes, pre, periodP)
		if _, ok := flowSpeed[res.Node]; !ok {
			flowSpeed[res.Node] = make(map[string][]float64)
		}
		saveSpeedFlow(flowSpeed[res.Node], key, speed, 5)
	}

	return ctx.Dict(flowsDict).Put(string(res.Node), nf)
}

func (c Consolidator) Map(msg bh.Msg, ctx bh.MapContext) bh.MappedCells {
	return nodeDriversMap(msg.Data().(nom.FlowStatsQueryResult).Node)
}

// STATICS MODULE FUNCTIONS - CONTROL PLANE
// Funcion que guarda las portstats en un map, con un limite de elementos
func saveStats(dict map[string][]nom.PortStats, key string, stat []nom.PortStats, limit int) {
	dict[key] = append(dict[key], stat[0])

	if len(dict[key]) > limit {
		dict[key] = dict[key][1:]
	}

}

func saveSpeed(dict map[string][]float64, key string, speed float64, limit int) {
	dict[key] = append(dict[key], speed)

	if len(dict[key]) > limit {
		dict[key] = dict[key][1:]
	}
}

func getPeriod(nSec uint32, nNSec uint32, pSec uint32, pNSec uint32) float64 {
	a := float64((nSec + nNSec)) / float64(1000000000)
	b := float64((pSec + pNSec)) / float64(1000000000)
	return a - b
}

func getSpeed(now uint64, pre uint64, periodP float64) float64 {
	if periodP != float64(0) {
		return float64(((now - pre) * 8)) / periodP
	} else {
		return 0
	}
}

func getLinkBW(file string, nodeSRC nom.NodeID, nodeDST nom.NodeID) float64 {
	dictBW := make(map[string]map[string]string)

	readFile, err := os.Open(file)
	if err != nil {
		fmt.Println("Error en get link bandwidth, ", err)
		log.Fatal(err)
	}

	fileScan := bufio.NewScanner(readFile)
	fileScan.Split(bufio.ScanLines)

	for fileScan.Scan() {
		line := strings.Split(fileScan.Text(), ",")
		s1 := line[0]
		s2 := line[1]
		//bwd := line[2] // Random Capacities
		bwd := line[3] // Original Capacities
		if _, ok := dictBW[s1]; !ok {
			dictBW[s1] = make(map[string]string)
		}
		dictBW[s1][s2] = bwd
		if _, ok := dictBW[s2]; !ok {
			dictBW[s2] = make(map[string]string)
		}
		dictBW[s2][s1] = bwd
	}

	if err := fileScan.Err(); err != nil {
		log.Fatal("Error reading file bw_r.txt")
		fmt.Println("Error reading file bw_r.txt")
		return -1
	}
	
	bwLink, ok := dictBW[string(nodeSRC)][string(nodeDST)]
	if !ok {
		fmt.Println("Error: no se puede guardar BWLink")
		return -1
	}
	bw, err := strconv.ParseFloat(bwLink, 64)
	if err != nil {
		fmt.Println("Error: No sirve parseFloat, ", err)
	}
	readFile.Close()
	return bw
}

func getFreeBw(portCapacity float64, speed float64) float64 {
	return math.Max(portCapacity-(speed/1000.0), 0)
}

type PortConsolidator struct{}

func (c PortConsolidator) Rcv(msg bh.Msg, ctx bh.RcvContext) error {
	data := msg.Data().(nom.PortStatsQueryResult)

	portNo, err := strconv.Atoi(string(data.Port))
	if err != nil {
		fmt.Println("Error strconv Atoi")
	}
	
	k := string(nom.ParseUIDPort(nom.NodeID(data.Node), nom.PortID(data.Port)))

	if _, ok := stats["port"]; !ok {
		stats["port"] = make(map[string]nom.PortStatsQueryResult)
	}
	mutexData.Lock()
	stats["port"][k] = data
	mutexData.Unlock()
	//freeBandwidth[nom.NodeID(data.Node)] = make(map[nom.PortID]float64)
	mutexPortStats.Lock()
	saveStats(dictPortStats, k, data.Stats, 5)
	mutexPortStats.Unlock()
	
	if portNo != int(of13.PP_LOCAL) {
		if portNo != 1 {
			pre = 0
			var act uint64 = 0
			var speed float64 = 0
			periodP = float64(config.MONITOR_PERIOD)
			mutexPortStats.Lock()
			tmp = dictPortStats[k]
			if len(tmp) > 1 {
				pre = tmp[len(tmp)-2].TxBytes + tmp[len(tmp)-2].RxBytes
				act = tmp[len(tmp)-1].TxBytes + tmp[len(tmp)-1].RxBytes
				dn1 := tmp[len(tmp)-1].Duration
				dns1 := tmp[len(tmp)-1].DurationNsec
				dn2 := tmp[len(tmp)-2].Duration
				dns2 := tmp[len(tmp)-2].DurationNsec
				periodP = math.Abs(getPeriod(dn1, dns1, dn2, dns2))
				speed = getSpeed(act, pre, periodP)
			}else{
				speed = getSpeed(act, pre, periodP)
			}
			mutexPortStats.Unlock()
			
			mutexSpeed.Lock()
			saveSpeed(dictPortSpeed, k, speed, 5)
			mutexSpeed.Unlock()

			file := "/home/controller2/go/src/github.com/kandoo/beehive-netctrl/bw_r.txt"

			for _, lk := range arrLinksCon {
				ndF, prtF := nom.ParsePortUID(lk.From)
				ndT, prtT := nom.ParsePortUID(lk.To)
				if nom.UID(prtF) != "1" && nom.UID(prtT) != "1" {
					if string(lk.From) == k {
						bwLink := getLinkBW(file, ndF, ndT)
						if bwLink != -1 {
							if _, ok := portFeatures[ndF]; !ok {
								portFeatures[ndF] = make(map[nom.PortID][]float64)
							}
							if _, ok := freeBandwidth[ndF]; !ok {
								freeBandwidth[ndF] = make(map[nom.PortID]float64)
							}
							bwLinkKbps := bwLink * 1000.0
							portFeatures[ndF][prtF] = append(portFeatures[ndF][prtF], bwLinkKbps)
							freeBw := getFreeBw(bwLinkKbps, speed)
							
							freeBandwidth[ndF][prtF] = freeBw
						}
					}

				}
			}
		}

	}
	return nil
}

func (c PortConsolidator) Map(msg bh.Msg, ctx bh.MapContext) bh.MappedCells {
	return nodeDriversMap(msg.Data().(nom.PortStatsQueryResult).Node)
}

type poll struct{}

type Poller struct{}

func (p Poller) Rcv(msg bh.Msg, ctx bh.RcvContext) error {
	dict := ctx.Dict(driversDict)
	n++
	var nds []nodeDrivers
	dict.ForEach(func(k string, v interface{}) bool {
		node := nom.UID(k)
		nd := v.(nodeDrivers)
		
		// Colocamos los siguientes if para saber cada cuanto tiempo obtenemos las metricas
		if period >= 12*10 {
			if period >= 12*(10+1) {
				period = 0
			}
			if period != 0 {
				query := nom.FlowStatsQuery{
					Node: node,
				}

				for _, b := range deleteDup(nd.Ports) {
					queryPort := nom.PortQuery{
						Port: nom.UID(b.ID),
						Node: b.Node,
					}
					sendToMaster(queryPort, b.Node, ctx)
				}
				sendToMaster(query, node, ctx)
			}
		}
		if period2 >= 12*8 {
			if period2 >= 12*(8+1) {
				period2 = 0
			}
			if period2 != 0 {
				// Creamos un echo request para medir el Delay
				actualTime := time.Now()
				echo := nom.EchoRequest{
					Data: actualTime.String(),
				}
				sendToMaster(echo, node, ctx)
			}

		}

		if period3 >= 12*8 {
			if period3 != 0 {
				ctx.Emit(nom.LldpTimeout{})
			}
			period3 = 0
		}

		updated := false
		for i := range nd.Drivers {
			if nd.Drivers[i].OutPings > MaxPings {
				// Se desconecta el Nodo cuando el numero de ping llega al limite
				fmt.Println("Emite NodeDisconnected ", node)
				ctx.SendToBee(nom.NodeDisconnected{
					Node:   nom.Node{ID: nom.NodeID(node)},
					Driver: nd.Drivers[i].Driver,
				}, ctx.ID())
				continue
			}
			ctx.SendToBee(nom.Ping{}, nd.Drivers[i].Driver.BeeID)
			nd.Drivers[i].OutPings++
			updated = true
		}

		if updated {
			nds = append(nds, nd)
		}

		period++
		period2++
		period3++

		return true
	})

	for _, nd := range nds {
		if err := dict.Put(string(nd.Node.ID), nd); err != nil {
			glog.Warningf("error in encoding drivers: %v", err)
		}
	}
	return nil
}

func (p Poller) Map(msg bh.Msg, ctx bh.MapContext) bh.MappedCells {
	return bh.MappedCells{}
}

func deleteDup(arr []nom.Port) []nom.Port {
	var arrNew []nom.Port
	for i := 0; i < len(arr)-1; i++ {
		if arr[i].Name == arr[i+1].Name {
			arrNew = append(arrNew, arr[i])
		}
	}
	return arrNew
}

type mtr struct{}

type monitor struct{}

func (n monitor) Rcv(msg bh.Msg, ctx bh.RcvContext) error {
	contMonitor++
	fmt.Println("Monitor ", contMonitor)
	getPortLoss()
	getLinkFreeBw()
	getLinkUsedBw()
	writeValues()

	if len(stats["port"]) != 0 {
		showStats("link")
		http.SendBandwidth(0)
		http.SendTopology(0)
		http.SendMetrics(0)

		http.GetBestRoutesInterDomain()
		time.Sleep(time.Duration(10) * time.Second)
		plan, errRead := ioutil.ReadFile("/home/controller2/go/src/github.com/kandoo/beehive-netctrl/bestRoutesGlobal.json")
		if errRead != nil {
			fmt.Println("Inter-Domain Routes Not Found...")
			return nil
		}

		var flag bool
		var data http.BestRoutes
		errx := json.Unmarshal(plan, &data)
		if errx != nil {
			fmt.Println("Cannot unmareshal the json ", errx)
		}
		
		fmt.Println("Installing Inter-Domain Routes in FLow Tables...")
		for i, dataDijkstra := range data.Routes {
			for c, idDijkstra := range dataDijkstra {
				//fmt.Println("nodes: ", dataDijkstra)
				if containNode(dataDijkstra[0], nodosCtrl) {
					if len(arrRoutes) != 0 {
						//fmt.Println("i y c: ", i, " -- ", c)
						if idDijkstra == arrRoutes[i][c] {
							flag = true
						} else {
							flag = false
							break
						}
					} else {
						flag = false
					}
				}else {
					flag = true
				}
			}

			if len(arrRoutes) == 0 {
				rr = append(rr, dataDijkstra)
			} else {
				rr[i] = dataDijkstra
			}

			if !flag {
				fmt.Print(dataDijkstra, " ... ")

				for c, idDijkstra := range dataDijkstra {
					if containNode(dataDijkstra[0], nodosCtrl) {
						if containNode(idDijkstra, nodosCtrl) {
							if idDijkstra != dataDijkstra[len(dataDijkstra)-1] {

								var dstByte byte
								decimalNumber, _ := strconv.ParseInt(strconv.Itoa(dataDijkstra[len(dataDijkstra)-1]), 16, 64)
								dstByte = byte(decimalNumber)
								
								if i >=0 && i < len(data.Ports) && c >= 0 && c < len(data.Ports[i]) {
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
													Ports: []nom.UID{nom.UID(data.Ports[i][c])},
												},
											},
										},
									}
									ctx.Emit(addFlow)
								}
							}
						}
					}
				}
			}
		}
		arrRoutes = rr
	}
	return nil
}

func (n monitor) Map(msg bh.Msg, ctx bh.MapContext) bh.MappedCells {
	return bh.MappedCells{bh.CellKey{linksController, "1"}}
}

func containNode(id int, nodex map[nom.UID]string) bool {
	for idx, _ := range nodex{
		idInt, _ := strconv.Atoi(string(idx))
		if id == idInt {
			return true
		}
	}
	return false
}

func getSwDst(node nom.UID, port nom.UID) nom.UID {
	for _, link := range arrLinksCon {
		from := nom.ParseUIDPort(nom.NodeID(node), nom.PortID(port))
		if from == link.From {
			return link.To
		}
	}
	return ""
}

func saveStatsPortLoss(dict map[string][]lossPortStats, key string, stat lossPortStats, limit int) {
	dict[key] = append(dict[key], stat)

	if len(dict[key]) > limit {
		dict[key] = dict[key][1:]
	}

}

type lossPortStats struct {
	LossPort float64
	Key      nom.UID
}

func getPortLoss() {
	bodies := stats["port"]
	for _, stat := range bodies {
		portNo, err := strconv.Atoi(string(stat.Port))
		if err != nil {
			fmt.Println("Error en strconv Atoi")
		}
		if portNo != 1 && portNo != int(of13.PP_LOCAL) {
			key1 := string(nom.ParseUIDPort(nom.NodeID(stat.Node), nom.PortID(stat.Port)))
			mutexPortStats.Lock()
			tmpp := dictPortStats[key1]
			var txPktSrc uint64 = 0
			txPktSrc = tmpp[len(tmpp)-1].TxPackets

			key2 := getSwDst(stat.Node, stat.Port)
			if key2 != "" {
				tmpp2 := dictPortStats[string(key2)]
				var rxPktsDst uint64 = 0
				if len(tmpp2) != 0 {
					rxPktsDst = tmpp2[len(tmpp2)-1].RxPackets
				} 
				lossPort := (float64(txPktSrc) - float64(rxPktsDst)) / float64(txPktSrc)
				values := lossPortStats{
					LossPort: lossPort,
					Key:      key2,
				}
				if _, ok := portLoss[string(stat.Node)]; !ok {
					portLoss[string(stat.Node)] = make(map[string][]lossPortStats)
				}
				mutexPortLoss.Lock()
				saveStatsPortLoss(portLoss[string(stat.Node)], key1, values, 5)
				mutexPortLoss.Unlock()
			}
			mutexPortStats.Unlock()

		}
	}

	// Calcule total link loss
	for k1, value1 := range portLoss {
		for _, value2 := range value1 {
			key := value2[len(value2)-1].Key
			keyN, _ := nom.ParsePortUID(key)
			var lossSrc float64 = 0
			lossSrc = value2[len(value2)-1].LossPort

			var lossDst float64 = 0
			if len(portLoss[string(keyN)]) != 0 {
				if len(value2) != 0 {
					pl := portLoss[string(keyN)][string(key)]
					if len(pl) > 0 {
						lossDst = pl[len(pl)-1].LossPort
					}
				}
			}

			var lossTotal float64 = 0
			lossTotal = (math.Abs(lossSrc) + math.Abs(lossDst)) / 2
			link := k1 + "$$" + string(keyN)
			if lossTotal > 1.0 {
				lossTotal = 0.999
			}
			linkLoss[link] = lossTotal * 100.0
		}
	}
}

func getLinkFreeBw() {
	for k1, value1 := range freeBandwidth {
		for k2, value2 := range value1 {
			freeBw1 := value2
			key2 := getSwDst(nom.UID(k1), nom.UID(k2))
			kN, kP := nom.ParsePortUID(key2)
			freeBw2 := freeBandwidth[kN][kP]
			linkFree := (freeBw1 + freeBw2) / 2
			link := string(k1) + "$$" + string(kN)
			linkFreeBw[link] = linkFree
		}
	}
}

//Para ordenar slice con llaves de tipo "1$$2"
type CustomSort []string

func (a CustomSort) Len() int      { return len(a) }
func (a CustomSort) Swap(i, j int) { a[i], a[j] = a[j], a[i] }
func (a CustomSort) Less(i, j int) bool {
	numsI := strings.Split(a[i], "$$")
	numsJ := strings.Split(a[j], "$$")

	num1I, err := strconv.Atoi(numsI[0])
	if err != nil {
		fmt.Println("Error en strconv Atoi")
	}
	num2I, err := strconv.Atoi(numsI[1])
	if err != nil {
		fmt.Println("Error en strconv Atoi")
	}
	num1J, err := strconv.Atoi(numsJ[0])
	if err != nil {
		fmt.Println("Error en strconv Atoi")
	}
	num2J, err := strconv.Atoi(numsJ[1])
	if err != nil {
		fmt.Println("Error en strconv Atoi")
	}

	if num1I != num1J {
		return num1I < num1J
	}
	return num2I < num2J
}

func getLinkUsedBw() {
	mutexSpeed.Lock()
	for key, speed := range dictPortSpeed {
		usedBw1 := speed[len(speed)-1]
		kN, kP := nom.ParsePortUID(nom.UID(key))
		key2 := getSwDst(nom.UID(kN), nom.UID(kP))
		if key2 == ""{
			continue
		}
		kN2, _ := nom.ParsePortUID(nom.UID(key2))
		var usedBw2 float64 = 0
		if len(dictPortSpeed[string(key2)]) != 0 {
			usedBw2 = dictPortSpeed[string(key2)][len(dictPortSpeed[string(key2)])-1]
		}
		linkUsed := (usedBw1 + usedBw2) / 2
		link := string(kN) + "$$" + string(kN2)
		linkUsedBw[link] = linkUsed
	}
	mutexSpeed.Unlock()
}

func writeValues() {
	if len(linkDelay) != 0 {
		for key, _ := range linkFreeBw {
			place0 := fmt.Sprintf("%.6f", linkFreeBw[key])
			place1 := fmt.Sprintf("%.6f", linkDelay[key])
			place2 := fmt.Sprintf("%.6f", linkLoss[key])
			place3 := fmt.Sprintf("%.6f", linkUsedBw[key])
			netInfo[key] = []string{place0, place1, place2}
			netMetrics[key] = []string{place0, place3, place1, place2}

			file, err := os.Create("/home/controller2/go/src/github.com/kandoo/beehive-netctrl/net_info.csv")
			if err != nil {
				glog.Error("Error create file CSV! ", err)
				continue
			}

			writer := csv.NewWriter(file)

			headerNames := []string{"node1", "node2", "bwd", "delay", "pkloss"}

			err = writer.Write(headerNames)
			if err != nil {
				glog.Error("Error writting to CSV file Header ", err)
			}

			for k, val := range netInfo {
				del := strings.Index(k, "$$")
				Ns := k[:del]
				Nd := k[del+2:]
				arr := []string{Ns, Nd, val[0], val[1], val[2]}
				err = writer.Write(arr)
				if err != nil {
					glog.Error("Error writting to CSV file Data ", err)
				}
			}
			writer.Flush()
			file.Close()
			
			ct := strconv.Itoa(contMonitor)

			fileMetrics, err := os.Create("/home/controller2/go/src/github.com/kandoo/beehive-netctrl/metrics/" + ct + "_net_metrics.csv")
			if err != nil {
				glog.Error("Error create file CSV Metrics! ", err)
				continue
			}

			writerMetrics := csv.NewWriter(fileMetrics)
			headerMetrics := []string{"node1", "node2", "free_bw", "used_bw", "delay", "pkloss"}
			err = writerMetrics.Write(headerMetrics)
			if err != nil {
				glog.Error("Error writting to CSV file Header ", err)
			}

			for k2, val2 := range netMetrics {
				del2 := strings.Index(k2, "$$")
				Ns2 := k2[:del2]
				Nd2 := k2[del2+2:]
				arr2 := []string{Ns2, Nd2, val2[0], val2[1], val2[2], val2[3]}
				err = writerMetrics.Write(arr2)
				if err != nil {
					glog.Error("Error writting to CSV file Data Metrics ", err)
				}
			}
			writerMetrics.Flush()
			fileMetrics.Close()
		}
	}
}

func showStats(typeStat string) {
	if typeStat == "link" {
		fmt.Println("node1  node2  used-bw(Kb/s)  free-bw(Kb/s)  latency(ms)  loss")
		fmt.Println("-----  -----  -------------  -------------  -----------  ----")
		//Para ordenar los datos
		arrKey = []string{}
		for key := range netInfo {
			arrKey = append(arrKey, key)
		}
		sort.Sort(CustomSort(arrKey))
		for _, k := range arrKey {
			del := strings.Index(k, "$$")
			Ns := k[:del]
			Nd := k[del+2:]
			lusd:= linkUsedBw[k] / 1000.0
			lusd2 := fmt.Sprintf("%.6f", lusd)
			fmt.Printf("%2s %6s %17s %17s %14s %10s\n", Ns, Nd, lusd2, netInfo[k][0], netInfo[k][1], netInfo[k][2])
		}
	}
}
