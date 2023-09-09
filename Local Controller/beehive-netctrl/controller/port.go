package controller

import (
	"fmt"

	"github.com/kandoo/beehive/Godeps/_workspace/src/github.com/golang/glog"

	bh "github.com/kandoo/beehive"
	"github.com/kandoo/beehive-netctrl/nom"
)

type portStatusHandler struct{}

func (h portStatusHandler) Rcv(msg bh.Msg, ctx bh.RcvContext) error {
	data := msg.Data().(nom.PortStatusChanged)
	dict := ctx.Dict(driversDict)
	k := string(data.Port.Node)
	v, err := dict.Get(k)
	if err != nil {
		fmt.Printf("NOMController: node %v not found", data.Port.Node)
		return fmt.Errorf("NOMController: node %v not found", data.Port.Node)
	}
	n := v.(nodeDrivers)
	if !n.isMaster(data.Driver) {
		glog.Warningf("NOMController: %v ignored, %v is not master, master is %v",
			data.Port, data.Driver, n.master())

		fmt.Printf("NOMController: %v ignored, %v is not master, master is %v",
			data.Port, data.Driver, n.master())
		return nil
	}
	
	if p, ok := n.Ports.GetPort(data.Port.UID()); ok {
		if p == data.Port {
			fmt.Printf("NOMController: duplicate port status change for %v",
				data.Port)
			return fmt.Errorf("NOMController: duplicate port status change for %v",
				data.Port)
		}

		n.Ports.DelPort(p)
	}

	n.Ports.AddPort(data.Port)

	n.Ports = append(n.Ports, data.Port)
	ctx.Emit(nom.PortUpdated{
		Port:   data.Port,
		Driver: data.Driver,
		Nodes:  data.Nodes,
	})
	dict.Put(k, n)
	return nil
}

func (h portStatusHandler) Map(msg bh.Msg, ctx bh.MapContext) bh.MappedCells {
	return bh.MappedCells{
		{driversDict, string(msg.Data().(nom.PortStatusChanged).Port.Node)},
	}
}
