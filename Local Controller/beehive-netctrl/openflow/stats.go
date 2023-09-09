package openflow

import (
	"fmt"
	"strconv"

	"github.com/kandoo/beehive-netctrl/nom"
	"github.com/kandoo/beehive-netctrl/openflow/of10"
	"github.com/kandoo/beehive-netctrl/openflow/of12"
	"github.com/kandoo/beehive-netctrl/openflow/of13"
)

func (d *of10Driver) handleStatsReply(reply of10.StatsReply,
	c *ofConn) error {

	switch {
	case of10.IsFlowStatsReply(reply):
		return d.handleFlowStatsReply(of10.NewFlowStatsReplyWithBuf(reply.Buf), c)
	default:
		return fmt.Errorf("of10Driver: unsupported stats type %v",
			reply.StatsType())
	}
}

func (d *of10Driver) handleFlowStatsReply(reply of10.FlowStatsReply,
	c *ofConn) error {

	nomReply := nom.FlowStatsQueryResult{
		Node: c.node.UID(),
	}
	for _, stat := range reply.FlowStats() {
		m, err := d.nomMatch(stat.Match())
		if err != nil {
			return err
		}
		stat := nom.FlowStats{
			Match:        m,
			Duration:     stat.DurationSec(),
			DurationNsec: stat.DurationNsec(),
			Packets:      stat.PacketCount(),
			Bytes:        stat.ByteCount(),
		}
		nomReply.Stats = append(nomReply.Stats, stat)
	}
	// {2 [{match(eth_dst={00:00:00:00:00:03 ff:ff:ff:ff:ff:ff}) 1.786s 0 0}
	// {match(eth_dst={00:00:00:00:00:01 ff:ff:ff:ff:ff:ff}) 1.778s 874 36708}]}
	c.ctx.Emit(nomReply)
	return nil
}

func (d *of12Driver) handleStatsReply(reply of12.StatsReply,
	c *ofConn) error {

	switch {
	case of12.IsFlowStatsReply(reply):
		return d.handleFlowStatsReply(of12.NewFlowStatsReplyWithBuf(reply.Buf), c)
	default:
		return fmt.Errorf("of12Driver: unsupported stats type %v",
			reply.StatsType())
	}
}

func (d *of12Driver) handleFlowStatsReply(reply of12.FlowStatsReply,
	c *ofConn) error {

	nomReply := nom.FlowStatsQueryResult{
		Node: c.node.UID(),
	}
	for _, stat := range reply.FlowStats() {
		m, err := d.nomMatch(stat.Match())
		if err != nil {
			return err
		}
		stat := nom.FlowStats{
			Match:        m,
			Duration:     stat.DurationSec(),
			DurationNsec: stat.DurationNsec(),
			Packets:      stat.PacketCount(),
			Bytes:        stat.ByteCount(),
		}
		nomReply.Stats = append(nomReply.Stats, stat)
	}
	c.ctx.Emit(nomReply)
	return nil
}

func (d *of13Driver) handleStatsReply(reply of13.StatsReply,
	c *ofConn) error {

	switch {
	case of13.IsFlowStatsReply2(reply):
		return d.handleFlowStatsReply(of13.NewFlowStatsReplyWithBuf(reply.Buf), c)
	case of13.IsPortStatsReply(reply):
		return d.handlePortStatsReply(of13.NewPortStatsReplyWithBuf(reply.Buf), c)
	default:
		return fmt.Errorf("of13Driver: unsupported stats type %v",
			reply.StatsType())
	}
}

func (d *of13Driver) handleFlowStatsReply(reply of13.FlowStatsReply,
	c *ofConn) error {
	//fmt.Println("-------- Entra a FlowStats reply--------")
	//fmt.Println("statsFlow: ", reply.Buf[:40])
	nomReply := nom.FlowStatsQueryResult{
		Node: c.node.UID(),
	}

	for _, stat := range reply.FlowStats() {
		m, err := d.nomMatch(stat.Match())
		if err != nil {
			return err
		}
		stat := nom.FlowStats{
			Match:        m,
			Duration:     stat.DurationSec(),
			DurationNsec: stat.DurationNsec(),
			Packets:      stat.PacketCount(),
			Bytes:        stat.ByteCount(),
		}
		//fmt.Println("Stats: ", stat)
		nomReply.Stats = append(nomReply.Stats, stat)
	}
	c.ctx.Emit(nomReply)
	return nil
}

// Colocamos las stats del puerto
func (d *of13Driver) handlePortStatsReply(reply of13.PortStatsReply,
	c *ofConn) error {

	nomReply := nom.PortStatsQueryResult{
		Node: c.node.UID(),
	}

	for _, stat := range reply.PortStats2() {
		portStat := nom.PortStats{
			RxPackets:    stat.RxPackets(),
			TxPackets:    stat.TxPackets(),
			RxBytes:      stat.RxBytes(),
			TxBytes:      stat.TxBytes(),
			RxDropped:    stat.RxDropped(),
			TxDropped:    stat.TxDropped(),
			RxErrors:     stat.RxErrors(),
			TxErrors:     stat.TxErrors(),
			RxFrameErr:   stat.RxFrameErr(),
			RxOverErr:    stat.RxOverErr(),
			RxCrcErr:     stat.RxCrcErr(),
			Collisions:   stat.Collisions(),
			Duration:     stat.DurationSec(),
			DurationNsec: stat.DurationNSec(),
		}
		nomReply.Stats = append(nomReply.Stats, portStat)
		nomReply.Port = nom.UID(strconv.Itoa(stat.PortNo2()))
	}
	//fmt.Println("statportpk: ", nomReply.Node, "$$", nomReply.Port)//, " --> ", nomReply.Stats[0].TxBytes, " - ", nomReply.Stats[0].RxBytes, " - ", nomReply.Stats[0].Duration, " - ", nomReply.Stats[0].DurationNsec)
	c.ctx.Emit(nomReply)

	return nil
}
