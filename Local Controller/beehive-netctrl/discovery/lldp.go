package discovery

import (
	"errors"
	"strconv"
	"time"

	bh "github.com/kandoo/beehive"
	"github.com/kandoo/beehive-netctrl/net/bpdu"
	"github.com/kandoo/beehive-netctrl/net/lldp"
	"github.com/kandoo/beehive-netctrl/nom"
	"github.com/kandoo/beehive-netctrl/openflow/of13"
)

func sendLLDPPacket(n nom.Node, p nom.Port, ctx bh.RcvContext) {
	pkt := nom.PacketOut{
		Node:     n.UID(),
		Packet:   nom.Packet(encodeLLDP(n, p)),
		BufferID: 0xFFFFFFFF,
		Actions: []nom.Action{
			nom.ActionForward{
				Ports: []nom.UID{p.UID()},
			},
		},
	}
	ctx.Emit(pkt)
}

func sendBPDUPacket(n nom.Node, p nom.PortStatusChanged, ctx bh.RcvContext) {
	pktBPUD := nom.PacketOut{
		Node:     n.UID(),
		InPort:   nom.UID(strconv.Itoa(int(of13.PP_CONTROLLER))),
		Packet:   nom.Packet(encodeBPDU(n, p)),
		BufferID: 0xFFFFFFFF,
		Actions: []nom.Action{
			nom.ActionForward{
				Ports: []nom.UID{p.Port.UID()},
			},
		},
	}
	ctx.Emit(pktBPUD)
}

func encodeBPDU(n nom.Node, p nom.PortStatusChanged) []byte {
	b := make([]byte, 256)
	h := bpdu.NewSTPProtocolWithBuf(b)
	h.Init()
	h.SetSrcMac(p.Port.MACAddr)
	h.SetDstMac([6]byte{0x01, 0x80, 0xC2, 0x00, 0x00, 0x00})
	h.SetTrailer()
	size := h.Size()

	tlvb := b[size:]
	chTLV := bpdu.NewChassisMacTLVWithBuf(tlvb)
	chTLV.Init()
	size += chTLV.Size()

	tlvb = b[size:]
	pTLV := bpdu.NewSTPTLVWithBuf(tlvb)
	pTLV.Init()
	pTLV.SetRootIdent(p.Nodes[p.Port.Node].Port.MACAddr, uint16(32768))
	pTLV.SetPathCost(uint16(2000))
	pTLV.SetBridgeIdent(p.Nodes[p.Port.Node].Port.MACAddr, uint16(32768))
	pTLV.SetDelay()
	size += pTLV.Size2()

	return b[:size+10]
}

func encodeLLDP(n nom.Node, p nom.Port) []byte {
	b := make([]byte, 256)
	h := lldp.NewLinkDiscoveryProtocolWithBuf(b)
	h.Init()
	h.SetSrcMac(n.MACAddr)
	h.SetDstMac([6]byte{0x01, 0x80, 0xC2, 0x00, 0x00, 0x0E})
	size := h.Size()

	tlvb := b[size:]
	chTLV := lldp.NewChassisMacTLVWithBuf(tlvb)
	chTLV.Init()
	chTLV.SetMacAddr(n.MACAddr)
	size += chTLV.Size()

	tlvb = b[size:]
	pTLV := lldp.NewLinkDiscoveryTLVWithBuf(tlvb)
	pTLV.Init()
	pTLV.SetType(uint8(lldp.TLV_PORT_ID))

	pTLV.AddValue(byte(lldp.PORT_TLV_IFACE_NAME))
	for _, v := range []byte(p.UID()) {
		pTLV.AddValue(v)
	}
	size += pTLV.Size()

	tlvb = b[size:]
	ttlTLV := lldp.NewLinkDiscoveryTLVWithBuf(tlvb)
	ttlTLV.Init()
	ttlTLV.SetType(uint8(lldp.TLV_TTL))
	ttlTLV.AddValue(0)
	ttlTLV.AddValue(0xFF)

	size += ttlTLV.Size()
	txlvb := b[size:]
	ttcTLV := lldp.NewLinkDiscoveryTLVWithBuf(txlvb)
	ttcTLV.Init()
	ttcTLV.SetType(uint8(lldp.TLV_LATENCY_TAG))
	ttcTLV.SetSize(100)
	timeNow := time.Now().String()
	ttcTLV.SetTimeStamp(timeNow)
	size += ttcTLV.Size()
	size += 2

	// TODO(soheil): Maybe add a few custom fields?
	return b[:size]
}

func decodeLLDP(b []byte) (nom.Node, nom.Port, error) {
	h := lldp.NewLinkDiscoveryProtocolWithBuf(b)
	size := h.Size()

	tlvb := b[size:]
	chTLV := lldp.NewChassisMacTLVWithBuf(tlvb)
	if chTLV.Size() == 0 {
		return nom.Node{}, nom.Port{}, errors.New("decodeLLDP: no chassis id")
	}
	n := nom.Node{
		MACAddr: chTLV.MacAddr(),
	}
	size += chTLV.Size()

	tlvb = b[size:]
	pTLV := lldp.NewLinkDiscoveryTLVWithBuf(tlvb)
	if pTLV.Size() == 0 || pTLV.Type() != uint8(lldp.TLV_PORT_ID) {
		return nom.Node{}, nom.Port{}, errors.New("decodeLLDP: no port id")
	}

	v := pTLV.Value()
	if v[0] != uint8(lldp.PORT_TLV_IFACE_NAME) {
		return nom.Node{}, nom.Port{}, errors.New("decodeLLDP: no port iface name")
	}

	portUID := nom.UID(v[1:])
	nID, pID := nom.ParsePortUID(portUID)
	n.ID = nID

	return n, nom.Port{ID: pID, Node: n.UID()}, nil
}
