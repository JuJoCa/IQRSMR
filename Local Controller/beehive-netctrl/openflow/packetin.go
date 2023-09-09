package openflow

import (
	"fmt"
	//"reflect"

	"github.com/kandoo/beehive-netctrl/nom"
	"github.com/kandoo/beehive-netctrl/openflow/of10"
	"github.com/kandoo/beehive-netctrl/openflow/of12"
	"github.com/kandoo/beehive-netctrl/openflow/of13"
	"github.com/kandoo/beehive/Godeps/_workspace/src/github.com/golang/glog"
)

func (of *of10Driver) handlePacketIn(in of10.PacketIn, c *ofConn) error {
	inPort := in.InPort()
	// Ignore packet-ins on switch specific ports.
	if inPort > uint16(of10.PP_MAX) {
		glog.V(2).Infof("ignoring packet-in on %v", inPort)
		return nil
	}

	port, ok := of.ofPorts[inPort]

	if !ok {
		return fmt.Errorf("of10Driver: port not found %v", inPort)
	}

	if glog.V(2) {
		glog.Infof("packet received: %v", in)
	}

	nomIn := nom.PacketIn{
		Node:     c.node.UID(),
		InPort:   port.UID(),
		BufferID: nom.PacketBufferID(in.BufferId()),
	}
	nomIn.Packet = nom.Packet(in.Data())
	c.ctx.Emit(nomIn)
	/*
		//c.ctx.Emit(in)

		//buf := make([]byte, 32)
		//out := of10.NewPacketOutWithBuf(buf)
		//out.Init()
		//out.SetBufferId(in.BufferId())
		//out.SetInPort(in.InPort())

		//bcast := of10.NewActionOutput()
		//bcast.SetPort(uint16(of10.PP_FLOOD))

		//out.AddActions(bcast.ActionHeader)

		//if in.BufferId() == 0xFFFFFFFF {
		//for _, d := range in.Data() {
		//out.AddData(d)
		//}
		//} else {
		//out.SetBufferId(in.BufferId())
		//}

		//c.wCh <- out.Header
		//if err := c.WriteHeader(out.Header); err != nil {
		//return fmt.Errorf("Error in writing a packet out: %v", err)
		//}
	*/
	return nil
}

func (of *of12Driver) handlePacketIn(in of12.PacketIn, c *ofConn) error {
	m := in.Match()
	fmt.Println("m: ", m)
	if m.Type() == uint16(of12.PMT_STANDARD) {
		glog.Warningf("standard matches are not supported")
		fmt.Printf("standard matches are not supported\n")
		return nil
	}

	var inPort uint32
	hasInPort := false

	xm, _ := of12.ToOXMatch(in.Match())
	for _, f := range xm.Fields() {
		if of12.IsOxmInPort(f) {
			xp, _ := of12.ToOxmInPort(f)
			inPort = xp.InPort()
			hasInPort = true
		}
	}

	if !hasInPort {
		glog.V(2).Infof("packet in does not have an input port")
		fmt.Println("packet in does not have an input port")
		return nil
	}

	// Ignore packet-ins on switch specific ports.
	if inPort > uint32(of10.PP_MAX) {
		glog.V(2).Infof("ignoring packet-in on %v", inPort)
		return nil
	}

	port, ok := of.ofPorts[inPort]
	if !ok {
		return fmt.Errorf("of12Driver: port not found %v", inPort)
	}

	if glog.V(2) {
		glog.Infof("packet received: %v", in)
	}

	nomIn := nom.PacketIn{
		Node:     c.node.UID(),
		InPort:   port.UID(),
		BufferID: nom.PacketBufferID(in.BufferId()),
	}
	nomIn.Packet = nom.Packet(in.Data())
	c.ctx.Emit(nomIn)

	return nil
}

func (of *of13Driver) handlePacketIn(in of13.PacketIn, c *ofConn) error {
	m := in.Match()

	if m.Type() == uint16(of13.PMT_STANDARD) {
		fmt.Println("error1")
		glog.Warningf("standard matches are not supported")
		return nil
	}

	var inPort uint32
	hasInPort := false

	xm, _ := of13.ToOXMatch(in.Match())

	for _, f := range xm.Fields() {
		if of13.IsOxmInPort(f) {
			xp, _ := of13.ToOxmInPort(f)
			inPort = xp.InPort()
			hasInPort = true
		}
	}

	if !hasInPort {
		fmt.Println("error2 ", hasInPort)
		glog.V(2).Infof("packet in does not have an input port")
		return nil
	}

	// Ignore packet-ins on switch specific ports.
	if inPort > uint32(of10.PP_MAX) {
		fmt.Println("error3")
		glog.V(2).Infof("ignoring packet-in on %v", inPort)
		return nil
	}

	port, ok := of.ofPorts[inPort]
	if !ok {
		fmt.Println("error4")
		return fmt.Errorf("of13Driver: port not found %v", inPort)
	}

	if glog.V(2) {
		glog.Infof("packet received: %v", in)
	}

	nomIn := nom.PacketIn{
		Node:     c.node.UID(),
		InPort:   port.UID(),
		BufferID: nom.PacketBufferID(in.BufferId()),
	}

	nomIn.Packet = nom.Packet(in.Data())
	//fmt.Println("PacketIn: ", nomIn)
	c.ctx.Emit(nomIn)

	return nil
}
