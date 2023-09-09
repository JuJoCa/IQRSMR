package openflow

import (
	//"fmt"
	"io"

	bh "github.com/kandoo/beehive"
	"github.com/kandoo/beehive-netctrl/nom"
	"github.com/kandoo/beehive-netctrl/openflow/of"
	"github.com/kandoo/beehive/Godeps/_workspace/src/github.com/golang/glog"
)

type ofConnConfig struct {
	readBufLen int
}

type ofConn struct {
	of.HeaderConn

	ctx bh.RcvContext // RcvContext of the detached bee running ofConn.

	readBufLen int         // Maximum number of packets to read.
	wCh        chan bh.Msg // Messages to be written.
	wErr       error       // Last error in write.

	node   nom.Node // Node that this connection represents.
	driver ofDriver // OpenFlow driver of this connection.
}

func (c *ofConn) drainWCh() {
	for {
		if _, ok := <-c.wCh; !ok {
			return
		}
	}
}

func (c *ofConn) Start(ctx bh.RcvContext) {
	defer func() {
		if c.driver != nil {
			c.driver.handleConnClose(c)
		}
		c.Close()
		// TODO(soheil): is there any better way to prevent deadlocks?
		//fmt.Printf("%v drains write queue for %v", ctx, c.RemoteAddr())
		glog.Infof("%v drains write queue for %v", ctx, c.RemoteAddr())
		go c.drainWCh()
	}()
	//fmt.Println("ofconn: ", c.HeaderConn, " nodeconf: ", c.node)
	//fmt.Println("c: ", c)
	c.ctx = ctx

	c.wCh = make(chan bh.Msg, ctx.Hive().Config().DataChBufSize)

	var err error

	if c.driver, err = c.handshake(); err != nil {
		//glog.Errorf("Error in OpenFlow handshake: %v", err)
		//fmt.Println("c.handshake: ", c.driver)
		return
	}

	stop := make(chan struct{})

	wdone := make(chan struct{})
	go c.doWrite(wdone, stop)

	rdone := make(chan struct{})
	go c.doRead(rdone, stop)

	select {
	case <-rdone:
		//fmt.Println("rdone")
		close(stop)
	case <-wdone:
		//fmt.Println("wdone")
		close(stop)
	}

	<-rdone
	<-wdone
	//fmt.Println("Termina el programa")
}

func (c *ofConn) doWrite(done chan struct{}, stop chan struct{}) {
	defer close(done)

	written := false
	var msg bh.Msg
	for {
		msg = nil
		if !written {
			select {
			case msg = <-c.wCh:
			case <-stop:
				//fmt.Println("return1")
				return
			}
		} else {
			select {
			case msg = <-c.wCh:
			case <-stop:
				//fmt.Println("return2")
				return
			default:
				if c.wErr = c.HeaderConn.Flush(); c.wErr != nil {
					//fmt.Println("err wErr1: ", c.wErr)
					//continue
					return
				}
				written = false
				//fmt.Println("continue")
				continue
			}
		}

		// Write the message.
		err := c.driver.handleMsg(msg, c)
		if err != nil {
			//fmt.Println("err handlemsg: ", err)
			return
		}
		if c.wErr != nil {
			//fmt.Println("err wErr2: ", c.wErr)
			return
		}

		if err != nil {
			//fmt.Println("ofconn: Cannot convert NOM message to OpenFlow: ", err)
			//glog.Errorf("ofconn: Cannot convert NOM message to OpenFlow: %v",
				//err)
		}
		written = true
	}
	//fmt.Println("se salio de dowrite")
}

func (c *ofConn) doRead(done chan struct{}, stop chan struct{}) {
	defer close(done)

	pkts := make([]of.Header, c.readBufLen)

	for {
		select {
		case <-stop:
			//fmt.Println("return1read")
			return
		default:
		}

		n, err := c.ReadHeaders(pkts)
		//if len(pkts[0].Buf) > 50 {
		//	fmt.Println("pkts: ", pkts[0].Buf[0:50])
		//}

		if err != nil {
			if err == io.EOF {
				//fmt.Println("connection closed", c.RemoteAddr())
				glog.Infof("connection %v closed", c.RemoteAddr())
			} else {
				//fmt.Printf("cannot read from the connection %v: %v\n", c.RemoteAddr(),
				//err)
				glog.Errorf("cannot read from the connection %v: %v", c.RemoteAddr(),
					err)
			}
			//fmt.Println("return2read")
			return
		}

		for _, pkt := range pkts[:n] {
			if err := c.driver.handlePkt(pkt, c); err != nil {
				//fmt.Println("Error en hadlePkt")
				glog.Errorf("%s", err)
				return
			}
		}

		pkts = pkts[n:]
		if len(pkts) == 0 {

			pkts = make([]of.Header, c.readBufLen)
		}
	}
	//fmt.Println("Se salio de doread")
}

func (c *ofConn) Stop(ctx bh.RcvContext) {
	c.Close()
}

func (c *ofConn) Rcv(msg bh.Msg, ctx bh.RcvContext) error {
	c.wCh <- msg
	return nil
}

func (c *ofConn) NodeUID() nom.UID {
	return c.node.UID()
}

func (c *ofConn) WriteHeader(pkt of.Header) error {
	c.wErr = c.HeaderConn.WriteHeader(pkt)
	return c.wErr
}
