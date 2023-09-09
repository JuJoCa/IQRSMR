package discovery

import (
	"container/heap"
	"encoding/binary"
	"fmt"
	"sort"
	"strconv"
	"time"
	"encoding/json"
	"io/ioutil"
	"os/exec"
	"bytes"

	bh "github.com/kandoo/beehive"
	"github.com/kandoo/beehive-netctrl/net/ethernet"
	"github.com/kandoo/beehive-netctrl/nom"
	"github.com/kandoo/beehive/Godeps/_workspace/src/github.com/golang/glog"
)

const (
	nodeDict  = "N"
	linksDict = "L"
	dictHost  = "H"
	dictNode  = "O"
	algorithm = "iqrsmr"
)

type nodePortsAndLinks struct {
	N nom.Node
	P []nom.Port
	L []nom.Link
}

var existingNodes1 []nom.NodeID
var existingNodes2 []nom.NodeID
var ban = false
var arrIndex []nom.NodeID

//var config.DELAY_DETECTING_PERIOD int = 9

func ShortestPathCentralized1(from, to nom.UID, lks map[nom.UID]*[]nom.Link) (
	paths [][]nom.Link, length int) {

	if from == to {
		return nil, 0
	}

	visited := make(map[nom.UID]distAndLinks)
	visited[from] = distAndLinks{Dist: 0}

	pq := nodeAndDistSlice{{Dist: 0, Node: from}}
	heap.Init(&pq)

	for len(pq) != 0 {
		nd := heap.Pop(&pq).(nodeAndDist)
		if nd.Node == to {
			continue
		}
		nodeLinks := lks
		nd.Dist = visited[nd.Node].Dist
		for _, links := range nodeLinks {
			for _, l := range *links {
				nid, _ := nom.ParsePortUID(l.To)
				ton := nom.UID(nid)
				if dl, ok := visited[ton]; ok {
					switch {
					case nd.Dist+1 < dl.Dist:
						glog.Fatalf("invalid distance in BFS")
					case nd.Dist+1 == dl.Dist:
						dl.BackLinks = append(dl.BackLinks, l)
						visited[ton] = dl
					}
					continue
				}

				visited[ton] = distAndLinks{
					Dist:      nd.Dist + 1,
					BackLinks: []nom.Link{l},
				}
				ndto := nodeAndDist{
					Dist: nd.Dist + 1,
					Node: ton,
				}
				heap.Push(&pq, ndto)
			}
		}
	}

	existingNodes1 = nil
	existingNodes2 = nil
	return allPaths1(from, to, visited)
}

func contain(a []nom.NodeID, x nom.NodeID) bool {
	var i int = 0
	for _, n := range a {
		if x == n {
			if i > 0 {
				return true
			}
			i++
		}
	}
	return false
}

func allPaths1(from, to nom.UID, visited map[nom.UID]distAndLinks) (
	[][]nom.Link, int) {

	if from == to {
		return nil, 0
	}

	todl, ok := visited[to]
	if !ok {
		return nil, -1
	}
	// TODO: convertir en funcion

	var arr = make(map[string]nom.Link)
	keys := make([]string, 0, len(arr))
	for _, s := range todl.BackLinks {
		fm, _ := nom.ParsePortUID(s.From)
		arr[string(fm)] = s
	}

	for k := range arr {
		keys = append(keys, k)
	}

	sort.Strings(keys)

	var paths [][]nom.Link
	for _, k := range keys {
		existingNodes1 = nil
		existingNodes2 = nil
		lfn, _ := nom.ParsePortUID(arr[k].From)
		ltn, _ := nom.ParsePortUID(arr[k].To)
		if !contain(existingNodes1, ltn) {
			existingNodes1 = append(existingNodes1, ltn)
			prevpaths, _ := allPaths2(from, nom.UID(lfn), visited)
			if len(prevpaths) == 0 {
				paths = append(paths, []nom.Link{arr[k]})
				continue
			}
			for _, p := range prevpaths {
				paths = append(paths, append(p, arr[k]))
			}
		}
	}

	return paths, todl.Dist
}

func allPaths2(from, to nom.UID, visited map[nom.UID]distAndLinks) (
	[][]nom.Link, int) {

	if from == to {
		return nil, 0
	}

	todl, ok := visited[to]
	if !ok {
		return nil, -1
	}
	// TODO: convertir en funcion

	var arr = make(map[string]nom.Link)
	keys := make([]string, 0, len(arr))
	for _, s := range todl.BackLinks {
		fm, _ := nom.ParsePortUID(s.From)
		arr[string(fm)] = s
	}

	for k := range arr {
		keys = append(keys, k)
	}

	sort.Strings(keys)

	var paths [][]nom.Link
	for _, k := range keys {
		lfn, _ := nom.ParsePortUID(arr[k].From)
		ltn, _ := nom.ParsePortUID(arr[k].To)

		if !contain(existingNodes1, lfn) {
			existingNodes1 = append(existingNodes1, ltn)
			prevpaths, _ := allPaths2(from, nom.UID(lfn), visited)
			if len(prevpaths) == 0 {
				paths = append(paths, []nom.Link{arr[k]})
				continue
			}
			for _, p := range prevpaths {
				paths = append(paths, append(p, arr[k]))
			}
		}
	}

	return paths, todl.Dist
}

func (np *nodePortsAndLinks) hasPort(port nom.Port) bool {
	// Entra el nodo, puerto y direccion mac del enlace (link)
	for _, p := range np.P {
		if p.ID == port.ID {
			return true
		}
	}
	return false
}

func (np *nodePortsAndLinks) removePort(port nom.Port) bool {
	for i, p := range np.P {
		if p.ID == port.ID {
			np.P = append(np.P[:i], np.P[i+1:]...)
			return true
		}
	}
	return false
}

func (np *nodePortsAndLinks) linkFrom(from nom.UID) (nom.Link, bool) {
	for _, l := range np.L {
		if l.From == from {
			return l, true
		}
	}
	return nom.Link{}, false
}

func (np *nodePortsAndLinks) hasLinkFrom(from nom.UID) bool {
	_, ok := np.linkFrom(from)
	return ok
}

func (np *nodePortsAndLinks) hasLink(link nom.Link) bool {
	id := link.UID()
	for _, l := range np.L {
		if l.UID() == id {
			return true
		}
	}
	return false
}

func (np *nodePortsAndLinks) removeLink(link nom.Link) bool {
	for i, l := range np.L {
		if l.From == link.From {
			np.L = append(np.L[:i], np.L[i+1:]...)
			return true
		}
	}
	return false
}

type nodeJoinedHandler struct{}

func (h *nodeJoinedHandler) Rcv(msg bh.Msg, ctx bh.RcvContext) error {
	joined := msg.Data().(nom.NodeJoined)
	d := ctx.Dict(nodeDict)
	n := nom.Node(joined)
	k := string(n.UID())
	var np nodePortsAndLinks
	if v, err := d.Get(k); err != nil {
		glog.Warningf("%v rejoins", n)
	} else {
		np = v.(nodePortsAndLinks)
	}
	np.N = n
	arrIndex = append(arrIndex, n.ID)
	return d.Put(k, np)
}

func (h *nodeJoinedHandler) Map(msg bh.Msg, ctx bh.MapContext) bh.MappedCells {
	return bh.MappedCells{
		{nodeDict, string(nom.Node(msg.Data().(nom.NodeJoined)).UID())},
	}
}

type nodeLeftHandler struct{}

func (h *nodeLeftHandler) Rcv(msg bh.Msg, ctx bh.RcvContext) error {
	n := nom.Node(msg.Data().(nom.NodeLeft))
	d := ctx.Dict(nodeDict)
	k := string(n.UID())
	if _, err := d.Get(k); err != nil {
		return fmt.Errorf("%v is not joined", n)
	}
	return d.Del(k)
}

func (h *nodeLeftHandler) Map(msg bh.Msg, ctx bh.MapContext) bh.MappedCells {
	return bh.MappedCells{
		{nodeDict, string(nom.Node(msg.Data().(nom.NodeLeft)).UID())},
	}
}

var driv = make(map[nom.UID]nom.Driver)

type portUpdateHandler struct{}

func (h *portUpdateHandler) Rcv(msg bh.Msg, ctx bh.RcvContext) error {
	a := nom.PortStatusChanged(msg.Data().(nom.PortUpdated))
	p := a.Port
	d := ctx.Dict(nodeDict)
	k := string(p.Node)
	v, err := d.Get(k)
	if err != nil {
		glog.Warningf("%v added before its node", p)
		ctx.Snooze(1 * time.Second)
		return nil
	}

	np := v.(nodePortsAndLinks)

	var index int = 0
	if np.hasPort(p) {
		glog.Warningf("%v readded", p)
		//np.removePort(p)
		if len(*linksSorth[p.Node]) > 1 {
			ay := *linksSorth[p.Node]
			for i, lk := range *linksSorth[p.Node] {
				nL, pL := nom.ParsePortUID(lk.From)
				if nom.UID(nL) == p.Node && pL == p.ID {
					index = i
				}
			}
			ay = append(ay[:index], ay[index+1:]...)
			linksSorth[p.Node] = &ay
		}

		if len(*portSorth[p.Node]) > 1 {
			av := *portSorth[p.Node]
			for i, pt := range *portSorth[p.Node] {
				if pt.Node == p.Node && pt.ID == p.ID {
					index = i
				}
			}
			av = append(av[:index], av[index+1:]...)
			portSorth[p.Node] = &av
		}

		portCopy := make(map[nom.UID][]nom.Port)
		for ki, bh := range portSorth {
			for _, bk := range *bh {
				portCopy[ki] = append(portCopy[ki], bk)
			}
		}
		np.P = portCopy[p.Node]
		return d.Put(k, np)
	}

	sendLLDPPacket(np.N, p, ctx)

	if algorithm == "stp" {
		dropall := nom.AddFlowEntry{
			Flow: nom.FlowEntry{
				Node: np.N.UID(),
				Match: nom.Match{
					Fields: []nom.Field{
						nom.InPort(nom.ParseUIDPort(nom.NodeID(np.N.UID()), p.ID)),
					},
				},
				Priority: 65534,
				Actions:  []nom.Action{},
			},
		}
		ctx.Emit(dropall)
	}

	np.P = append(np.P, p)
	driv[p.Node] = a.Driver
	return d.Put(k, np)
}

func (h *portUpdateHandler) Map(msg bh.Msg, ctx bh.MapContext) bh.MappedCells {
	return bh.MappedCells{
		{nodeDict, string(msg.Data().(nom.PortUpdated).Port.Node)},
	}
}

type timeoutHandler struct{}

func (h *timeoutHandler) Rcv(msg bh.Msg, ctx bh.RcvContext) error {
	d := ctx.Dict(nodeDict)
	d.ForEach(func(key string, val interface{}) bool {
		np := val.(nodePortsAndLinks)
		for _, port := range np.P {
			sendLLDPPacket(np.N, port, ctx)
		}
		return true
	})
	ban = true
	return nil
}

func (h *timeoutHandler) Map(msg bh.Msg, ctx bh.MapContext) bh.MappedCells {
	return bh.MappedCells{}
}

func ByteToString(a byte) string {
	return fmt.Sprintf("%01x", a)
}

type pktInHandler struct{}

var hts = make(map[int]*nom.HostIn)

func (h *pktInHandler) Rcv(msg bh.Msg, ctx bh.RcvContext) error {
	pin := msg.Data().(nom.PacketIn)

	e := ethernet.NewEthernetWithBuf([]byte(pin.Packet))

	if e.Type() != uint16(ethernet.ETH_T_LLDP) {
		return nil
	}
	
	_, port, err := decodeLLDP([]byte(pin.Packet))
	if err != nil {
		return err
	}

	d := ctx.Dict(nodeDict)
	k := string(pin.Node)
	if _, err := d.Get(k); err != nil {
		return fmt.Errorf("Node %v not found", pin.Node)
	}

	l := nom.Link{
		ID:    nom.LinkID(port.UID()),
		From:  pin.InPort,
		To:    port.UID(),
		State: nom.LinkStateUp,
	}
	ctx.Emit(NewLink(l))

	l = nom.Link{
		ID:    nom.LinkID(pin.InPort),
		From:  port.UID(),
		To:    pin.InPort,
		State: nom.LinkStateUp,
	}
	ctx.Emit(NewLink(l))

	return nil
}

func (h *pktInHandler) Map(msg bh.Msg, ctx bh.MapContext) bh.MappedCells {
	return bh.MappedCells{
		{nodeDict, string(msg.Data().(nom.PacketIn).Node)},
	}
}

var linksSorth = make(map[nom.UID]*[]nom.Link)
var portSorth = make(map[nom.UID]*[]nom.Port)
var banderaLinks int = 0
type NewLink nom.Link

type newLinkHandler struct{}

func (h *newLinkHandler) Rcv(msg bh.Msg, ctx bh.RcvContext) error {
	l := nom.Link(msg.Data().(NewLink)) 	
	n, _ := nom.ParsePortUID(l.From)
	d := ctx.Dict(nodeDict) 
	k := string(n)
	v, err := d.Get(k)
	if err != nil {
		return nil
	}

	np := v.(nodePortsAndLinks)

	if oldl, ok := np.linkFrom(l.From); ok {
		if oldl.UID() == l.UID() {
			return nil
		}
		np.removeLink(oldl)
		ctx.Emit(nom.LinkDeleted(oldl))
	}

	glog.V(2).Infof("Link detected %v", l)
	ctx.Emit(nom.LinkAdded(l))
	np.L = append(np.L, l)
	linksSorth[np.N.UID()] = &np.L
	portSorth[np.N.UID()] = &np.P

	d.Put(k, np)

	var flagIndex bool = false
	var linkRedundante []nom.Link
	
	for _, valx := range linksSorth{
		for _, valz := range *valx {
			nodeComp, _ := nom.ParsePortUID(valz.To)
			for _, index := range arrIndex {
				if index == nodeComp {
					flagIndex = true
					break
				}else {
					flagIndex = false
				}
			}
			if !flagIndex {
				linkRedundante = append(linkRedundante, valz)
				
			}
		}
	}
	banderaLinks = banderaLinks + 1
	bin := make([]byte, 4)
	if banderaLinks == 28 {
		newlist := removeDupolicate(arrIndex)
		for _, i := range newlist {
			var dstByte byte

			decimalNumber, _ := strconv.ParseInt(strconv.Itoa(i), 16, 64)
			dstByte = byte(decimalNumber)

			binary.LittleEndian.PutUint32(bin, uint32(i))
			addr := nom.MACAddr{0, 0, 0, 0, 0, dstByte}
			ipv4 := nom.IPv4Addr{10, 0, 0, bin[0]}
			addFlow := nom.AddFlowEntry{
				Flow: nom.FlowEntry{
					Node: nom.UID(strconv.Itoa(i)),
					Match: nom.Match{
						Fields: []nom.Field{
							nom.EthDst{
								Addr: addr,
								Mask: nom.MaskNoneMAC,
							},
						},
					},
					Priority: 100,
					Actions: []nom.Action{
						nom.ActionForward{
							Ports: []nom.UID{nom.UIDJoin(strconv.Itoa(i), "1")},
						},
					},
				},
			}
			ctx.Emit(addFlow)
			addHost := nom.HostIn{
				NodeTopo: nom.UID(strconv.Itoa(i)),
				MAC:      addr,
				Ip:       ipv4,
			}
			hts[i] = &addHost
		}

		file, err1 := json.MarshalIndent(linksSorth, "", "\t")
		if err1 != nil {
			fmt.Println("Error MarshalIdent, ", err1)
		}
		
		err2 := ioutil.WriteFile("/home/controller2/go/src/github.com/kandoo/beehive-netctrl/topologyGlobal.json", file, 0644)
		if err2 != nil {
			fmt.Println("Error Write topology test, ", err2)
		}

		fmt.Println("Send Access Data")
		ctx.Emit(nom.DataAccess{
			Hosts:  hts,
			Ports:  portSorth,
			Driver: driv,
			Links:  linksSorth,
		})

		fmt.Println("Send Algorithm Data")
		if algorithm == "stp" {
			ctx.Emit(nom.ShortestpathLinks{
				Lks:    linksSorth,
				Hosts:  hts,
				Ports:  portSorth,
				Driver: driv,
			})
		}
		if algorithm == "iqrsmr" {
			ctx.Emit(nom.ResultCont{
				Links: linksSorth,
				Port:  portSorth,
				Drive: driv,
				NodoRedundante: linkRedundante,
			})
		}
		if algorithm == "uniQLearning" {
			ctx.Emit(nom.Qlearning{
				Links: linksSorth,
				Port:  portSorth,
				Drive: driv,
			})
		}

		banderaLinks = 0
	}
	return nil
}

func (h *newLinkHandler) Map(msg bh.Msg, ctx bh.MapContext) bh.MappedCells {
	n, _ := nom.ParsePortUID(msg.Data().(NewLink).From)
	return bh.MappedCells{{nodeDict, string(n)}}
}

func removeDupolicate(arr []nom.NodeID) []int {
	keys := make(map[int]bool)
	list := []int{}
	for _, f := range arr {
		entry, _ := strconv.Atoi(string(f))
		if _, value := keys[entry]; !value {
			keys[entry] = true
			list = append(list, entry)
		}
	}
	return list
}

type Topo struct{}

type TopoDis struct{}

func (h TopoDis) Rcv(msg bh.Msg, ctx bh.RcvContext) error {
	file, err1 := json.MarshalIndent(linksSorth, "", "\t")
	if err1 != nil {
		fmt.Println("Error MarshalIdent, ", err1)
	}

	err2 := ioutil.WriteFile("/home/controller2/go/src/github.com/kandoo/beehive-netctrl/topologyGlobal.json", file, 0644)
	if err2 != nil {
		fmt.Println("Error Write topology test, ", err2)
	}

	var flagIndex bool = false
	var linkRedundante []nom.Link
	for _, valx := range linksSorth{
		for _, valz := range *valx {
			nodeComp, _ := nom.ParsePortUID(valz.To)
			for _, index := range arrIndex {
				if index == nodeComp {
					flagIndex = true
					break
				}else {
					flagIndex = false
				}
			}
			if !flagIndex {
				linkRedundante = append(linkRedundante, valz)
			}
		}
	}

	//fmt.Println("Envia datos access 2")
	ctx.Emit(nom.DataAccess{
		Hosts:  hts,
		Ports:  portSorth,
		Driver: driv,
		Links:  linksSorth,
	})

	//fmt.Println("Envia datos de algoritmo 2")
	if algorithm == "stp" {
		ctx.Emit(nom.ShortestpathLinks{
			Lks:    linksSorth,
			Hosts:  hts,
			Ports:  portSorth,
			Driver: driv,
		})
	}
	if algorithm == "iqrsmr" {
		ctx.Emit(nom.ResultCont{
			Links: linksSorth,
			Port:  portSorth,
			Drive: driv,
			NodoRedundante: linkRedundante,
		})
	}
	if algorithm == "uniQLearning" {
		ctx.Emit(nom.Qlearning{
			Links: linksSorth,
			Port:  portSorth,
			Drive: driv,
		})
	}
	return nil
}

func (h TopoDis) Map(msg bh.Msg, ctx bh.MapContext) bh.MappedCells {
	return bh.MappedCells{}
}

// RegisterDiscovery registers the handlers for topology discovery on the hive.
func RegisterDiscovery(h bh.Hive) {
	a := h.NewApp("discovery")
	a.Handle(nom.NodeJoined{}, &nodeJoinedHandler{})
	a.Handle(nom.NodeLeft{}, &nodeLeftHandler{})
	a.Handle(nom.PortUpdated{}, &portUpdateHandler{})
	// TODO(soheil): Handle PortRemoved.
	a.Handle(nom.PacketIn{}, &pktInHandler{})
	a.Handle(NewLink{}, &newLinkHandler{})
	a.Handle(Topo{}, TopoDis{})
	a.Handle(nom.LldpTimeout{}, &timeoutHandler{})
	var conta int = 0
	go func() {
		for {
			if conta < 2 {

				time.Sleep(60 * time.Second)
				h.Emit(Topo{})
				conta++
			} else {
				time.Sleep(15 * time.Second)
				h.Emit(Topo{})
			}
			conta+=1
		}
	}()

	go func() {
		for {
			time.Sleep(time.Duration(25 * time.Second))
			fmt.Println("Execute IQRSMR Algorithm")
			//timeStart := time.Now()
			cmd := exec.Command("python", "/home/controller2/go/src/github.com/kandoo/beehive-netctrl/q-multi.py")
			var stdout, stderr bytes.Buffer
			cmd.Stdout = &stdout
			cmd.Stderr = &stderr

			if err := cmd.Run(); err != nil {
				fmt.Println("error: ", err)
				fmt.Println("stdout: ", stdout.String())
				fmt.Println("stderr: ", stderr.String())
			}
			//timeElapsed := time.Since(timeStart)
			fmt.Println("File IQRSMR Algorithm created in Local Controller ")
		}
	}()
}
