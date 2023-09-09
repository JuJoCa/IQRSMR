package controller

import (
	"fmt"

	bh "github.com/kandoo/beehive"
	"github.com/kandoo/beehive-netctrl/nom"
)

type addFlowHandler struct{}

func (h addFlowHandler) Rcv(msg bh.Msg, ctx bh.RcvContext) error {
	add := msg.Data().(nom.AddFlowEntry)
	var nf nodeFlows
	if v, err := ctx.Dict(flowsDict).Get(string(add.Flow.Node)); err == nil {
		nf = v.(nodeFlows)
	}
	added := nom.FlowEntryAdded{Flow: add.Flow}
	sendToMaster(add, add.Flow.Node, ctx)
	if nf.maybeAddFlow(add) {
		ctx.Emit(added)
	}
	if !add.Subscriber.IsNil() {
		fmt.Println("--> Entro a Subscriber.IsNil")
		ctx.SendToCell(added, add.Subscriber.App, add.Subscriber.Cell())
	}
	return ctx.Dict(flowsDict).Put(string(add.Flow.Node), nf)
}

func (h addFlowHandler) Map(msg bh.Msg, ctx bh.MapContext) bh.MappedCells {
	return nodeDriversMap(msg.Data().(nom.AddFlowEntry).Flow.Node)
}

type delFlowHandler struct{}

func (h delFlowHandler) Rcv(msg bh.Msg, ctx bh.RcvContext) error {
	del := msg.Data().(nom.DelFlowEntry)
	delNode, _ := nom.ParsePortUID(nom.UID(del.Match.Fields[0].(nom.InPort)))
	fmt.Println("delete: ", del)
	sendToMaster(del, nom.UID(delNode), ctx)

	return nil
}

func (h delFlowHandler) Map(msg bh.Msg, ctx bh.MapContext) bh.MappedCells {
	del := msg.Data().(nom.DelFlowEntry)
	delNode := del.Match.Fields[0].(nom.InPort)

	return nodeDriversMap(nom.UID(delNode))
}
