package openflow

import (
	"errors"
	"fmt"
	"net"

	bh "github.com/kandoo/beehive"
	"github.com/kandoo/beehive-netctrl/openflow/of"
	"github.com/kandoo/beehive/Godeps/_workspace/src/github.com/golang/glog"
)

type ofListener struct {
	proto      string // The driver's listening protocol.
	addr       string // The driver's listening address.
	readBufLen int    // Maximum number of packets to read.
}

func (l *ofListener) Start(ctx bh.RcvContext) {
	nl, err := net.Listen(l.proto, l.addr)
	if err != nil {
		glog.Errorf("Cannot start the OF listener: %v", err)
		fmt.Printf("Cannot start the OF listener: %v \n", err)
		return
	}

	glog.Infof("OF listener started on %s:%s", l.proto, l.addr)
	fmt.Printf("OF listener started on %s:%s \n", l.proto, l.addr)

	defer func() {
		glog.Infof("OF listener closed")
		fmt.Println("OF listener closed")
		nl.Close()
	}()

	for {
		c, err := nl.Accept()
		if err != nil {
			glog.Errorf("Error in OF accept: %v", err)
			fmt.Printf("Error in OF accept: %v \n", err)
			return
		}

		l.startOFConn(c, ctx)
	}
}

func (l *ofListener) startOFConn(conn net.Conn, ctx bh.RcvContext) {
	ofc := &ofConn{
		HeaderConn: of.NewHeaderConn(conn),
		readBufLen: l.readBufLen,
	}
	ctx.StartDetached(ofc)
}

func (l *ofListener) Stop(ctx bh.RcvContext) {
}

func (l *ofListener) Rcv(msg bh.Msg, ctx bh.RcvContext) error {
	fmt.Println("No message should be sent to the listener")
	return errors.New("No message should be sent to the listener")
}
