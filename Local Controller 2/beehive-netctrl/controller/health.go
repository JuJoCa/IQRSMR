package controller

import (
	"fmt"
	"time"

	"github.com/kandoo/beehive/Godeps/_workspace/src/github.com/golang/glog"

	bh "github.com/kandoo/beehive"
)

type HealthChecker struct{}

func (h HealthChecker) Rcv(msg bh.Msg, ctx bh.RcvContext) error {
	db := msg.From()
	dict := ctx.Dict(driversDict)

	var nds []nodeDrivers
	dict.ForEach(func(k string, v interface{}) bool {
		nd := v.(nodeDrivers)
		updated := false
		for i := range nd.Drivers {
			if nd.Drivers[i].Driver.BeeID == db {
				nd.Drivers[i].LastSeen = time.Now()
				nd.Drivers[i].OutPings--
				updated = true
			}
		}

		if updated {
			nds = append(nds, nd)
		}

		return true
	})

	for _, nd := range nds {
		if err := dict.Put(string(nd.Node.ID), nd); err != nil {
			glog.Warningf("error in encoding drivers: %v", err)
			fmt.Printf("error in encoding drivers: %v", err)
		}
	}
	return nil
}

func (h HealthChecker) Map(msg bh.Msg, ctx bh.MapContext) bh.MappedCells {
	// Pong is always emitted as a reply. As such Map should never be called,
	// and if called the message should be dropped.
	return nil
}
