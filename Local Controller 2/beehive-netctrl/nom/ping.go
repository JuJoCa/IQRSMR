package nom

import (
	"encoding/gob"
)

// Ping represents a ping message sent to a driver. It is used to
// health-check the driver.
type Ping struct{}

// Pong represents a reply to a ping message sent by the driver.
type Pong struct{}

type EchoRequest struct {
	Data string
}

type Delay struct {
	DelayLLDP map[UID]map[UID]float64
	DelayEcho map[NodeID]float64
}

type LldpTimeout struct{}

type DataAccess struct {
	Data   map[UID]string
	Hosts  map[int]*HostIn
	Ports  map[UID]*[]Port
	Driver map[UID]Driver
	Links  map[UID]*[]Link
}

func init() {
	gob.Register(Ping{})
	gob.Register(Pong{})
	gob.Register(EchoRequest{})
	gob.Register(Delay{})
	gob.Register(LldpTimeout{})
	gob.Register(DataAccess{})
}
