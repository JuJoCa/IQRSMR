package openflow

/*
import (
	"fmt"
	"github.com/kandoo/beehive-netctrl/openflow/of"
	"github.com/kandoo/beehive-netctrl/openflow/of10"
)

const (
	MAX_PORT_NO = 0xfff
)

// For OpenFlow 1.2/1.3
const (
	BPDU_PKT_IN_PRIORITY = 0xffff
	NO_PKT_IN_PRIORITY   = 0xfffe
)

// Result of compared config BPDU priority.
const (
	SUPERIOR = -1
	REPEATED = 0
	INFERIOR = 1
)

// Port role
const (
	DESIGNATED_PORT     = 0 // The port which sends BPDU.
	ROOT_PORT           = 1 // The port which receives BPDU from a root bridge.
	NON_DESIGNATED_PORT = 2 // The port which blocked.

)

// Port state
//  DISABLE: Administratively down or link down by an obstacle.
//  BLOCK  : Not part of spanning tree.
//  LISTEN : Not learning or relaying frames.
//  LEARN  : Learning but not relaying frames.
//  FORWARD: Learning and relaying frames.

//TODO: Creo que esto ya esta definido en of10.go
const (
	PORT_STATE_DISABLE = 0
	PORT_STATE_BLOCK = 1
	PORT_STATE_LISTEN = 2
	PORT_STATE_LEARN = 3
	PORT_STATE_FORWARD = 4
)

/*type PORT_CONFIG struct {
	PORT_STATE_DISABLE
	PORT_STATE_BLOCK
	PORT_STATE_LISTEN
	PORT_STATE_LEARN
	PORT_STATE_FORWARD
}

// for OpenFlow 1.0
const (
	PORT_CONFIG_V1_0 := PORT_CONFIG{PORT_STATE_DISABLE: (of10.PPC_NO_RECV_STP
											|of10.PPC_NO_RECV
											|of10.PPC_NO_FLOOD
											|of10.PPC_NO_FWD ),
						PORT_STATE_BLOCK: of10.PPC_NO_RECV
											|of10.PPC_NO_FLOOD
											|of10.PPC_NO_FWD ),
						PORT_STATE_LISTEN: of10.PPC_NO_RECV
											|of10.PPC_NO_FLOOD),
						PORT_STATE_LEARN:of10.PPC_NO_FLOOD,
						PORT_STATE_FORWARD: 0}
)


type Stp struct {
	dp
}

func (s *Stp) close()  {
	for dpid
}

func hola() {
	fmt.Println("Hola StpLib", MAX_PORT_NO)
}
*/
