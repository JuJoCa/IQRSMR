package switching

import (
	//"fmt"
	//"reflect"

	"fmt"
	"strconv"
	"strings"
	"time"
	"io/ioutil"
	"encoding/json"

	bh "github.com/kandoo/beehive"
	http "github.com/kandoo/beehive-netctrl/http_client"
	"github.com/kandoo/beehive-netctrl/net/ethernet"
	"github.com/kandoo/beehive-netctrl/nom"
	"github.com/kandoo/beehive/Godeps/_workspace/src/github.com/golang/glog"
)

var lldpdelay = make(map[nom.UID]map[nom.UID]*float64)

var s = "s"

var (
	swAndPorts  = make(map[nom.UID]*[]nom.Port)
	hostsTopo   = make(map[int]*nom.HostIn)
	driver      = make(map[nom.UID]nom.Driver)
	Links       = make(map[nom.UID]*[]nom.Link)
	accessTable = make(map[nom.UID]string)
	arrBestRoute = make(map[[2]string]*http.BestRoutes)
	arrValuesFlow []string
)

type LearningSwitch struct {
	Hub
}

func (h LearningSwitch) Rcv(msg bh.Msg, ctx bh.RcvContext) error {
	in := msg.Data().(nom.PacketIn)

	src := in.Packet.SrcMAC()
	dst := in.Packet.DstMAC()

	e := ethernet.NewEthernetWithBuf([]byte(in.Packet))

	glog.V(2).Infof("received packet in from %v to %v", src, dst)

	if dst.IsLLDP() {
		timeOut := in.Packet.ObtainTime()
		timeActual := time.Now().String()

		pos := strings.Index(timeActual, "m=+")
		t, _ := strconv.ParseFloat(timeActual[pos+3:], 64)

		timeFw := t - timeOut
		
		var nodeSrc string
		if in.Packet[24] == byte(6) && in.Packet[25] == byte(5) {
			nodeSrc = string(in.Packet[26:31])
		}else {
			nodeSrc = string(in.Packet[26:30])
		}

		if _, ok := lldpdelay[nom.UID(nodeSrc)]; !ok {
			lldpdelay[nom.UID(nodeSrc)] = make(map[nom.UID]*float64)
		}
		lldpdelay[nom.UID(nodeSrc)][in.InPort] = &timeFw

		delay := nom.Delay{
			DelayLLDP: lldpdelay,
		}
		ctx.Emit(delay)
		glog.Infof("dropped LLDP packet to %v", dst)
		return nil
	}

	if e.Type() == uint16(ethernet.ETH_ARP) || e.Type() == uint16(ethernet.ETH_IPV4) {
		dstIp := nom.IPv4Addr{}
		if e.Type() == uint16(ethernet.ETH_IPV4) {
			dstIp = in.Packet.DstIp4()
		} else {
			dstIp = in.Packet.DstIp()
		}
		registreAccessInfo(swAndPorts, hostsTopo)
		result := getHostLocation(dstIp)
		if result != "" {
			datDst, _ := nom.ParsePortUID(result)
			packet := in.Packet

			out := nom.PacketOut{
				Node:     nom.UID(datDst),
				InPort:   in.InPort,
				BufferID: in.BufferID,
				Packet:   packet,
				Actions: []nom.Action{
					nom.ActionForward{
						Ports: []nom.UID{nom.UID(result)},
					},
				},
			}
			ctx.SendToBee(out, driver[nom.UID(datDst)].BeeID)
		}else {
			srcIp := nom.IPv4Addr{}
			if e.Type() == uint16(ethernet.ETH_IPV4) {
				srcIp = in.Packet.SrcIp4()
			} else {
				srcIp = in.Packet.SrcIp()
			}
			
			Nsrc := fmt.Sprintf("%d", srcIp[3])
			Ndst := fmt.Sprintf("%d", dstIp[3])
			plan, errRead := ioutil.ReadFile("/home/controller2/go/src/github.com/kandoo/beehive-netctrl/bestRoutesGlobal.json")
			if errRead != nil {
				fmt.Println("Error leyendo el archivo JSON ", errRead)
			}

			var data *http.BestRoutes
			err := json.Unmarshal(plan, &data)
			if err != nil {
				fmt.Println("Cannot unmareshal the json ", err)
			}

			NsrcInt, _ := strconv.Atoi(Nsrc)
			NdstInt, _ := strconv.Atoi(Ndst)
			var bstR = [][]int{}
			var bstP = [][]string{}
			for al, route := range data.Routes {
				if route[0] == NsrcInt && route[len(route)-1] == NdstInt {
					bstR = append(bstR, route)
					bstP = append(bstP, data.Ports[al])
				}
			}
			
			bestRoute :=  http.BestRoutes {
				Routes: bstR,
				Ports: bstP,
			}

			var coni int = 0
			for k := range accessTable {
				k1 := strings.Split(string(k), "$$")
				k1Int, _ := strconv.Atoi(k1[0])
				for _, o1 := range bestRoute.Routes {
					for _, o2 := range o1 {
						if k1Int == o2 {
							coni = coni + 1
						}
					}
				}
			}

			arrNew := bestRoute.Routes[0][:coni]
			arrP := []string{}
			for _, nd := range arrNew {
				for _, val := range bestRoute.Ports[0] {
					prt := strings.Split(val, "$$")
					prtInt, _ := strconv.Atoi(prt[0])
					if prtInt == nd {
						arrP = append(arrP, val)
					}
				}
			}

			ndT := strconv.Itoa(arrNew[len(arrNew)-1])

			out := nom.PacketOut{
				Node:     nom.UID(ndT),
				InPort:   in.InPort,
				BufferID: in.BufferID,
				Packet:   in.Packet,
				Actions: []nom.Action{
					nom.ActionForward{
						Ports: []nom.UID{nom.UID(arrP[len(arrP)-1])},
					},
				},
			}	
			ctx.SendToBee(out, driver[nom.UID(ndT)].BeeID)
		}
		return nil
	}

	if dst.IsMulticast() {
		return nil
	}
	return nil
}

func addValueFlow(arr []string, value string, timeLimit time.Duration) ([]string) {
	arr = append(arr, value)
	go func() {
		<- time.After(timeLimit)
		for i, v := range arr {
			if v == value {
				arr = append(arr[:i], arr[i+1:]...)
				arrValuesFlow = arr
				break
			}
		}
	}()
	return arr
}

func addValueRoute(arr map[[2]string]*http.BestRoutes, src string, dst string, value *http.BestRoutes, timeLimit time.Duration) (map[[2]string]*http.BestRoutes) {
	arr[[2]string{src,dst}] = value
	go func() {
		<- time.After(timeLimit)
		for i, v := range arr {
			if v == value {
				delete(arr, i)
				arrBestRoute = arr
				break
			}
		}
	}()
	return arr
}

func comparaValuesFlow(arr []string, value string) bool {
	for _, v := range arr {
		value1 := strings.Split(v, "$$")
		value2 := strings.Split(value, "$$")
		if value1[0] == value2[0] && value1[1] == value2[1] {
			return false
		}
	}
	return true
}

func getHostLocation(dst nom.IPv4Addr) nom.UID {
	for key, dat := range accessTable {
		del := strings.Index(dat, "$$")
		h := dat[:del]
		if h == dst.String() {
			return key
		}
	}
	return ""
}

func Invertir(arr []int) []int {
	for i, j := 0, len(arr)-1; i < j; i, j = i+1, j -1 {
		arr[i], arr[j] = arr[j], arr[i]
	}
	return arr
}

func registreAccessInfo(portSorth map[nom.UID]*[]nom.Port, hosts map[int]*nom.HostIn) {
	for _, ports := range portSorth {
		for _, port := range *ports {
			if port.ID == "1" {
				key := nom.ParseUIDPort(nom.NodeID(port.Node), port.ID)
				for _, b := range hosts {
					if b.NodeTopo == port.Node {
						value := b.Ip.String() + "$$" + b.MAC.String()
						accessTable[key] = value
					}
				}
			}
		}
	}
}

type DataAccessTable struct{}

func (h DataAccessTable) Rcv(msg bh.Msg, ctx bh.RcvContext) error {
	data := msg.Data().(nom.DataAccess)
	swAndPorts = data.Ports
	hostsTopo = data.Hosts
	driver = data.Driver
	Links = data.Links

	return nil
}

func (h DataAccessTable) Map(msg bh.Msg, ctx bh.MapContext) bh.MappedCells {
	return bh.MappedCells{bh.CellKey{s, "1"}}
}

// RegisterSwitch registers the learning switch application on the given
// hive with the provided options.
func RegisterSwitch(h bh.Hive, opts ...bh.AppOption) {
	app := h.NewApp("Switch", opts...)
	app.Handle(nom.PacketIn{}, LearningSwitch{})
	app.Handle(nom.DataAccess{}, DataAccessTable{})
}
