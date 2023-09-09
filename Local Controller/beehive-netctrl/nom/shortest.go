package nom

import (
	//"bytes"
	"encoding/gob"
)

type NodePortsAndLinks2 struct {
	N Node
	P []Port
	L []Link
}

type HostIn struct {
	NodeTopo UID
	MAC      MACAddr
	Ip       IPv4Addr
}

type ShortestpathLinks struct {
	Lks    map[UID]*[]Link
	DataT  map[UID]*NodePortsAndLinks2
	Hosts  map[int]*HostIn
	Ports  map[UID]*[]Port
	Driver map[UID]Driver
}

type ResultCont struct {
	Links map[UID]*[]Link
	Block [][]UID
	Drive map[UID]Driver
	Port  map[UID]*[]Port
	NodoRedundante []Link
}

type GetData struct{}

type Qlearning struct {
	Links map[UID]*[]Link
	Drive map[UID]Driver
	Port  map[UID]*[]Port
}

func init() {
	gob.Register(NodePortsAndLinks2{})
	gob.Register(HostIn{})
	gob.Register(ShortestpathLinks{})
	gob.Register(ResultCont{})
}
