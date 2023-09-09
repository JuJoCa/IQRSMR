package controller

import (
	"time"

	bh "github.com/kandoo/beehive"
	//"github.com/kandoo/beehive-netctrl/config"
	"github.com/kandoo/beehive-netctrl/nom"
)

func RegisterNOMController(h bh.Hive) {
	app := h.NewApp("NOMController", bh.Persistent(3))

	app.Handle(nom.NodeConnected{}, nodeConnectedHandler{})
	app.Handle(nom.NodeDisconnected{}, nodeDisconnectedHandler{})
	app.Handle(nom.PortStatusChanged{}, portStatusHandler{})

	app.Handle(nom.AddFlowEntry{}, addFlowHandler{})
	app.Handle(nom.DelFlowEntry{}, delFlowHandler{})

	app.Handle(nom.FlowStatsQuery{}, queryHandler{})

	app.Handle(nom.PacketOut{}, pktOutHandler{})

	app.Handle(nom.AddTrigger{}, addTriggerHandler{})

	app.Handle(nom.LinksToController{}, LinksController{})
	app.Handle(mtr{}, monitor{})

	app.Handle(nom.Delay{}, DelayHandle{})

	app.Handle(nom.FlowStatsQueryResult{}, Consolidator{})
	app.Handle(nom.PortStatsQueryResult{}, PortConsolidator{})
	app.Handle(nom.Pong{}, HealthChecker{})
	app.Handle(poll{}, Poller{})

	app.Detached(bh.NewTimer(time.Duration(15)*time.Second, func() {
		h.Emit(mtr{})
	}))

	app.Detached(bh.NewTimer(1*time.Second, func() {
		h.Emit(poll{})
	}))
}
