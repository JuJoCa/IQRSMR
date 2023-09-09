package kandoo

import (
	"time"

	bh "github.com/kandoo/beehive"
	"github.com/kandoo/beehive-netctrl/nom"
)

// RegisterApps registers Kandoo applications on the hive
func RegisterApps(hive bh.Hive, threshold uint64) {

	df := hive.NewApp("Shortestpath")
	df.Handle(nom.ShortestpathLinks{}, ShortestpathRcv{})
	df.Handle(nom.NodeJoined{}, Adder{})

	dj := hive.NewApp("iqrsmr")
	dj.Handle(nom.ResultCont{}, iqrsmr{})

	uq := hive.NewApp("UniqueQLearning")
	uq.Handle(nom.Qlearning{}, uniQLearning{})
	uq.Handle(nom.GetData{}, GetDataDijkstra{})

	type poll struct{}
	df.Handle(poll{}, Poller{})
	df.Detached(bh.NewTimer(1*time.Second, func() {
		hive.Emit(poll{})
	}))
}
