package controller

import (
	"fmt"
	"math"
	"strconv"
	"unicode"

	bh "github.com/kandoo/beehive"
	"github.com/kandoo/beehive-netctrl/nom"
)

var (
	delayLLDP       = make(map[nom.UID]map[nom.UID]float64)
	delayEcho       = make(map[nom.NodeID]float64)
	contador    int = 0
	flag        int = 0
	resultDelay     = make(map[nom.NodeID]map[nom.NodeID]float64)
	linkDelay       = make(map[string]float64)
)

func removeDupolicate(arr []int) []int {
	un := make(map[int]bool)
	r := []int{}
	for _, num := range arr {
		if !un[num] {
			un[num] = true
			r = append(r, num)
		}
	}
	return r
}

func containLetter(s string) bool {
	for _, r := range s {
		if unicode.IsLetter(r) {
			return true
		}
	}
	return false
}

type DelayHandle struct{}

func (d DelayHandle) Rcv(msg bh.Msg, ctx bh.RcvContext) error {
	data := msg.Data().(nom.Delay)

	arr := []int{}
	for key := range data.DelayLLDP {
		n, _ := nom.ParsePortUID(key)
		var ndec int64
		if containLetter(string(n)) {
			ndec, _ = strconv.ParseInt(string(n), 16, 64)
			n = nom.NodeID(strconv.FormatInt(ndec, 10))
		}

		nInt, err := strconv.Atoi(string(n))
		if err != nil {
			fmt.Println("Error en strconv Atoi")
		}
		arr = append(arr, nInt)
	}

	nodex := removeDupolicate(arr)
	arrTemp1 := make(map[int]bool)
	for _, lk := range nodesRed {
		nd, _ := nom.ParsePortUID(lk.To)
		ndInt, _ := strconv.Atoi(string(nd))
		arrTemp1[ndInt] = true
	}

	var nodes []int
	for _, valN := range nodex {
		if !arrTemp1[valN] {
			nodes = append(nodes, valN)
		}
	}

	if len(data.DelayLLDP) != 0 {
		delayLLDP = data.DelayLLDP
	}
	if len(data.DelayEcho) != 0 {
		delayEcho = data.DelayEcho
	}
	if len(numPorts) != 0 {
		flag = numPorts[0] - numPorts[1] - len(nodes)
	}

	if len(delayLLDP) != 0 && len(delayEcho) == len(nodes) {
		contador++
		if contador == flag {
			contador = 0
			for _, link1 := range arrLinksCon {
				NSrc, PSrc := nom.ParsePortUID(link1.From)
				NDst, PDst := nom.ParsePortUID(link1.To)
				fwdDelay := delayLLDP[link1.From][link1.To]
				//repDelay := delayLLDP[link1.To][link1.From]
				srcLatency := delayEcho[NSrc]
				dstLatency := delayEcho[NDst]

				result := fwdDelay - ((srcLatency + dstLatency) / 2)

				if len(portsBlock) != 0 {
					for _, pB := range portsBlock {
						if pB[0] == nom.UID(NSrc) && pB[1] == nom.UID(PSrc) {
							result = 0
						}
						if pB[0] == nom.UID(NDst) && pB[1] == nom.UID(PDst) {
							result = 0
						}
					}
				}
				delay := math.Abs(result)

				if _, ok := resultDelay[NSrc]; !ok {
					resultDelay[NSrc] = make(map[nom.NodeID]float64)
				}
				resultDelay[NSrc][NDst] = delay
			}

			for _, link2 := range arrLinksCon {
				NSrc, _ := nom.ParsePortUID(link2.From)
				NDst, _ := nom.ParsePortUID(link2.To)
				delay1 := resultDelay[NSrc][NDst]
				delay2 := resultDelay[NDst][NSrc]
				linkd := ((delay1 + delay2) * 1000.0) / 2
				link := string(NSrc) + "$$" + string(NDst)
				linkDelay[link] = linkd
			}
		}
	}
	return nil
}

func (d DelayHandle) Map(msg bh.Msg, ctx bh.MapContext) bh.MappedCells {
	return bh.MappedCells{bh.CellKey{linksController, "1"}}
}
