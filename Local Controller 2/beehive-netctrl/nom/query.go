package nom

import (
	"encoding/gob"
	"fmt"
)

// NodeQuery queries the information of a node.
type NodeQuery struct {
	Node UID
}

// NodeQueryResult is the result for NodeQuery.
type NodeQueryResult struct {
	Err  error
	Node Node
}

// PortQuery queries the information of a port.
type PortQuery struct {
	Port UID
	Node UID
}

// PortQueryResult is the result for a PortQuery.
type PortQueryResult struct {
	Err  error
	Port Port
}

// FlowStatsQuery queries the flows that would match the query. If Exact is
// false, it removes all flow entries that are subsumed by the given match.
type FlowStatsQuery struct {
	Node  UID
	Match Match
}

// Colocamos PortStatsQuery
type PortStatsQuery struct {
	//Port Port
	Node  UID
	Match Match
}

// FlowStatsQueryResult is the result for a FlowStatQuery
type FlowStatsQueryResult struct {
	Node  UID
	Stats []FlowStats
}

// Colocamos PortStatsQueryResult
type PortStatsQueryResult struct {
	Node  UID
	Port  UID
	Stats []PortStats
}

// FlowStats is the statistics of flow
type FlowStats struct {
	Match        Match
	Duration     uint32
	DurationNsec uint32
	Packets      uint64
	Bytes        uint64
}

//Colocamos las portStats
type PortStats struct {
	RxPackets    uint64
	TxPackets    uint64
	RxBytes      uint64
	TxBytes      uint64
	RxDropped    uint64
	TxDropped    uint64
	RxErrors     uint64
	TxErrors     uint64
	RxFrameErr   uint64
	RxOverErr    uint64
	RxCrcErr     uint64
	Collisions   uint64
	Duration     uint32
	DurationNsec uint32
}

func (stats FlowStats) BW() Bandwidth {
	if stats.Duration == 0 {
		return 0
	}
	fmt.Println("El bandwidth: ", Bandwidth(stats.Bytes/uint64(stats.Duration)))
	return Bandwidth(stats.Bytes / uint64(stats.Duration))
}

func init() {
	gob.Register(FlowStatsQuery{})
	gob.Register(FlowStatsQueryResult{})
	gob.Register(PortStatsQuery{})
	gob.Register(PortStatsQueryResult{})
	gob.Register(NodeQuery{})
	gob.Register(NodeQueryResult{})
	gob.Register(PortQuery{})
	gob.Register(PortQueryResult{})
	//gob.Register(flujostatsresult{})
}
