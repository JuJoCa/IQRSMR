package openflow

import (
	"errors"
	"fmt"
	"strconv"
	//"reflect"

	"github.com/kandoo/beehive-netctrl/nom"
	"github.com/kandoo/beehive-netctrl/openflow/of"
	"github.com/kandoo/beehive-netctrl/openflow/of10"
	"github.com/kandoo/beehive-netctrl/openflow/of12"
	"github.com/kandoo/beehive-netctrl/openflow/of13"
	"github.com/kandoo/beehive/Godeps/_workspace/src/github.com/golang/glog"
)

//var cont int = 0

func (c *ofConn) handshake() (ofDriver, error) {
	hdr, err := c.ReadHeader()
	if err != nil {
		//fmt.Println("Error de ReadHeader")
		return nil, err
	}
	
	h, err := of.ToHello(hdr)
	
	if err != nil {
		fmt.Println("Error de ToHello")
		return nil, err
	}

	glog.V(2).Info("%v received hello from a switch with OFv%v", c.ctx,
		h.Version())

	version := of.OPENFLOW_1_0

	if h.Version() >= uint8(of.OPENFLOW_1_3) {
		version = of.OPENFLOW_1_3
	}
	if h.Version() == uint8(of.OPENFLOW_1_2) {
		version = of.OPENFLOW_1_2
	}
	h.SetVersion(uint8(version))

	if err = c.WriteHeader(h.Header); err != nil {
		fmt.Println("Error de WriteHeader")
		return nil, err
	}
	c.Flush()

	glog.V(2).Info("%v sent hello to the switch", c.ctx)

	var driver ofDriver
	switch version {
	case of.OPENFLOW_1_0:
		driver = &of10Driver{}
		//fmt.Println("OpenFLow 1.0")
	case of.OPENFLOW_1_2:
		driver = &of12Driver{}
		//fmt.Println("OpenFLow 1.2")
	case of.OPENFLOW_1_3:
		driver = &of13Driver{}
		//fmt.Println("OpenFLow 1.3")
	}

	if err = driver.handshake(c); err != nil {
		fmt.Println("Error de handshake")
		return nil, err
	}

	if c.node.ID == nom.NodeID("0") {
		fmt.Println("Error de nodeID")
		return nil, errors.New("ofConn: invalid node after handshake")
	}

	return driver, nil
}

func (d *of10Driver) handshake(c *ofConn) error {
	freq := of10.NewFeaturesRequest()
	if err := c.WriteHeader(freq.Header); err != nil {
		return err
	}

	c.Flush()

	glog.V(2).Info("%v sent features request to the switch", c.ctx)

	hdr, err := c.ReadHeader()
	if err != nil {
		return err
	}

	v10, err := of10.ToHeader10(hdr)
	if err != nil {
		return err
	}

	frep, err := of10.ToFeaturesReply(v10)
	if err != nil {
		return err
	}

	glog.Infof("%v completes handshaking with switch %016x", c.ctx,
		frep.DatapathId())
	glog.Infof("%v disables packet buffers in switch %016x", c.ctx,
		frep.DatapathId())
	cfg := of10.NewSwitchSetConfig()
	cfg.SetMissSendLen(0xFFFF)
	c.WriteHeader(cfg.Header)
	nodeID := datapathIDToNodeID(frep.DatapathId())
	c.node = nom.Node{
		ID:           nodeID,
		MACAddr:      datapathIDToMACAddr(frep.DatapathId()),
		Capabilities: nil,
	}

	glog.Infof("%v is connected to %v", c.ctx, c.node)

	nomDriver := nom.Driver{
		BeeID: c.ctx.ID(),
		Role:  nom.DriverRoleDefault,
	}

	c.ctx.Emit(nom.NodeConnected{
		Node:   c.node,
		Driver: nomDriver,
	})

	d.ofPorts = make(map[uint16]*nom.Port)
	d.nomPorts = make(map[nom.UID]uint16)

	for _, p := range frep.Ports() {
		name := p.Name()

		port := nom.Port{
			ID:      portNoToPortID(uint32(p.PortNo())),
			Name:    string(name[:]),
			MACAddr: p.HwAddr(),
			Node:    c.NodeUID(),
		}

		d.ofPorts[p.PortNo()] = &port
		d.nomPorts[port.UID()] = p.PortNo()
		glog.Infof("%v added", port)
		if p.PortNo() <= uint16(of10.PP_MAX) {
			c.ctx.Emit(nom.PortStatusChanged{
				Port:   port,
				Driver: nomDriver,
			})
		}
	}
	return nil
}

func (d *of12Driver) handshake(c *ofConn) error {
	freq := of12.NewFeaturesRequest()
	if err := c.WriteHeader(freq.Header); err != nil {
		fmt.Println("Error de WriteHeader")
		return err
	}
	c.Flush()

	glog.V(2).Info("Sent features request to the switch")

	hdr, err := c.ReadHeader()
	if err != nil {
		//fmt.Println("Error de ReadHeader")
		return err
	}

	v12, err := of12.ToHeader12(hdr)
	//fmt.Println("v12: ", v12)
	if err != nil {
		fmt.Println("Error de ToHeader12")
		return err
	}

	frep, err := of12.ToFeaturesReply(v12)
	if err != nil {
		fmt.Println("Error de ToFeaturesReply OpenFLow12")
		return err
	}

	glog.Infof("Handshake completed for switch %016x", frep.DatapathId())
	//fmt.Printf("Handshake completed for switch %016x", frep.DatapathId())

	glog.Infof("Disabling packet buffers in the switch.")
	cfg := of12.NewSwitchSetConfig()
	cfg.SetMissSendLen(0xFFFF)
	c.WriteHeader(cfg.Header)

	nodeID := datapathIDToNodeID(frep.DatapathId())
	c.node = nom.Node{
		ID:      nodeID,
		MACAddr: datapathIDToMACAddr(frep.DatapathId()),
		Capabilities: []nom.NodeCapability{
			nom.CapDriverRole,
		},
	}

	nomDriver := nom.Driver{
		BeeID: c.ctx.ID(),
		Role:  nom.DriverRoleDefault,
	}
	c.ctx.Emit(nom.NodeConnected{
		Node:   c.node,
		Driver: nomDriver,
	})

	d.ofPorts = make(map[uint32]*nom.Port)
	d.nomPorts = make(map[nom.UID]uint32)
	for _, p := range frep.Ports() {
		if p.PortNo() > uint32(of12.PP_MAX) {
			continue
		}
		name := p.Name()
		port := nom.Port{
			ID:      portNoToPortID(p.PortNo()),
			Name:    string(name[:]),
			MACAddr: p.HwAddr(),
			Node:    c.NodeUID(),
		}
		d.ofPorts[p.PortNo()] = &port
		d.nomPorts[port.UID()] = p.PortNo()
		glog.Infof("%v added", port)
		c.ctx.Emit(nom.PortStatusChanged{
			Port:   port,
			Driver: nomDriver,
		})
	}

	return nil
}

func (d *of13Driver) handshake(c *ofConn) error {
	freq := of13.NewFeaturesRequest()
	if err := c.WriteHeader(freq.Header); err != nil {
		fmt.Println("Error de WriteHeader 13")
		return err
	}

	c.Flush()

	glog.V(2).Info("Sent features request to the switch")

	var frep of13.FeaturesReply
	for {
		hdr, err := c.ReadHeader()
		if err != nil {
			//fmt.Println("Error de ReadHeader 13")
			return err
		}

		v13, err := of13.ToHeader13(hdr)
		if err != nil {
			fmt.Println("Error de ToHeader13")
			return err
		}

		if v13.Buf[1] == byte(6) {
			frev, err := of13.ToFeaturesReply(v13)
			if err != nil {
				fmt.Println("Error de ToStatsRequest OpenFlow13")
				return err
			}
			frep = frev
			break
		}
	}

	glog.Infof("Handshake completed for switch %016x", frep.DatapathId())
	glog.Infof("Disabling packet buffers in the switch.")

	cfg := of13.NewSwitchSetConfig()
	cfg.SetMissSendLen(0xFFFF)
	c.WriteHeader(cfg.Header)

	nodeID := nom.NodeID(strconv.Itoa(int(frep.DatapathId())))
	fmt.Println("Connected Node [", nodeID,"]")
	c.node = nom.Node{
		ID:      nodeID,
		MACAddr: datapathIDToMACAddr(frep.DatapathId()),
		Capabilities: []nom.NodeCapability{
			nom.CapDriverRole,
		},
	}

	nomDriver := nom.Driver{
		BeeID: c.ctx.ID(),
		Role:  nom.DriverRoleDefault,
	}
	///////////////////////////////
	multi := of13.NewStatsRequest()

	if err := c.WriteHeader(multi.Header); err != nil {
		fmt.Println("Error de Multi WriteHeader 13")
		return err
	}

	c.Flush()

	glog.V(2).Info("Sent multipart request to the switch")

	var resmult of13.StatsReply
	for {
		multireq, err := c.ReadHeader()
		if multireq.Buf[1] == byte(19) {
			if err != nil {
				fmt.Println("Error de MultiRead ReadHeader 13")
				return err
			}

			v13mul, err := of13.ToHeader13(multireq)
			if err != nil {
				fmt.Println("Error de MultiToHeader ToHeader13")
				return err
			}

			resp, err := of13.ToStatsReply(v13mul)
			if err != nil {
				fmt.Println("Error de MultiToStatsReply OpenFlow13")
				return err
			}

			resmult = resp
			break
		}
	}

	c.ctx.Emit(nom.NodeConnected{
		Node:   c.node,
		Driver: nomDriver,
	})

	d.ofPorts = make(map[uint32]*nom.Port)
	d.nomPorts = make(map[nom.UID]uint32)
	var arrLocal = make(map[nom.UID]*nom.PortLocal)

	for _, p := range resmult.Ports() {
		name := p.Name()
		port := nom.Port{
			ID:      portNoToPortID(p.PortNo()),
			Name:    string(name[:]),
			MACAddr: p.HwAddr(),
			Node:    c.NodeUID(),
			//State:   nom.PortState(of13.PPC_NO_ALL),
			//Config:  nom.PortConfig(of13.PPC_NO_FWD_PACKET_IN),
		}
		//fmt.Println("Port: ", port)
		if p.PortNo() > uint32(of13.PP_MAX) {
			arrLocal[port.Node] = &nom.PortLocal{
				Port:   port,
				Driver: nomDriver,
			}
			continue
		}

		d.ofPorts[p.PortNo()] = &port
		d.nomPorts[port.UID()] = p.PortNo()
		glog.Infof("%v added", port)
		c.ctx.Emit(nom.PortStatusChanged{
			Port:   port,
			Driver: nomDriver,
			Nodes:  arrLocal,
		})
		/*c.ctx.SendToBee(nom.PortStatusChanged{
			Port:   port,
			Driver: nomDriver,
		}, nomDriver.BeeID)*/
	}

	addflow := nom.AddFlowEntry{
		Flow: nom.FlowEntry{
			Node:  c.node.UID(),
			Match: nom.Match{},
			Priority: 10,
			Actions: []nom.Action{
				nom.ActionSendToController{},
			},
		},
	}
	c.ctx.Emit(addflow)
	//fmt.Println(addflow)

	addlldp := nom.AddFlowEntry{
		Flow: nom.FlowEntry{
			Node: c.node.UID(),
			Match: nom.Match{
				Fields: []nom.Field{
					nom.EthDst{
						Addr: nom.LLDPMulticastMACs[0],
						Mask: nom.MaskNoneMAC,
					},
				},
			},
			Priority: 65535,
			Actions: []nom.Action{
				nom.ActionSendToController{},
			},
		},
	}
	c.ctx.Emit(addlldp)

	return nil
}
