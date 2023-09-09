package openflow

import (
	"strconv"
	"strings"
	"time"

	"github.com/kandoo/beehive-netctrl/nom"
	"github.com/kandoo/beehive-netctrl/openflow/of"
	"github.com/kandoo/beehive-netctrl/openflow/of10"
	"github.com/kandoo/beehive-netctrl/openflow/of12"
	"github.com/kandoo/beehive-netctrl/openflow/of13"
	"github.com/kandoo/beehive/Godeps/_workspace/src/github.com/golang/glog"
)

var echoLatency = make(map[nom.NodeID]float64)

func (d *of10Driver) handleEchoRequest(req of10.EchoRequest, c *ofConn) error {
	return doHandleEchoRequest(req.Header, of10.NewEchoReply().Header, c)
}

func (d *of12Driver) handleEchoRequest(req of12.EchoRequest, c *ofConn) error {
	return doHandleEchoRequest(req.Header, of12.NewEchoReply().Header, c)
}

func (d *of13Driver) handleEchoRequest(req of13.EchoRequest, c *ofConn) error {
	return doHandleEchoRequest(req.Header, of13.NewEchoReply().Header, c)
}

func (d *of13Driver) handleEchoReply(req of13.EchoReply, c *ofConn) error {
	return doHandleEchoReply(req.Header, c)
}

func doHandleEchoRequest(req of.Header, res of.Header, c *ofConn) error {
	glog.V(2).Infof("Received echo request from %v", c.node)
	//fmt.Printf("Received echo request from %v\n", c.node)
	res.SetXid(req.Xid())
	err := c.WriteHeaders([]of.Header{res})
	if err != nil {
		return err
	}
	c.Flush()
	glog.V(2).Infof("Sent echo reply to %v", c.node)
	//fmt.Printf("Sent echo reply to %v\n", c.node)
	return nil
}

func doHandleEchoReply(req of.Header, c *ofConn) error {
	time1 := string(req.Buf[8:])
	pos1 := strings.Index(time1, "m=+")
	time2 := time.Now().String()
	pos2 := strings.Index(time2, "m=+")

	t1, _ := strconv.ParseFloat(time1[pos1+3:pos1+15], 64)
	t2, _ := strconv.ParseFloat(time2[pos2+3:], 64)

	elapsed := t2 - t1
	echoLatency[c.node.ID] = elapsed
	//enviar echoilaterncy al controller
	delay := nom.Delay{
		DelayEcho: echoLatency,
	}
	//glog.Warningln(delay)
	c.ctx.Emit(delay)
	return nil
}
