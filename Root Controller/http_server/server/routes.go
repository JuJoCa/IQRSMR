package server

import (
	"fmt"
	"net/http"
	"strings"
	//"sync"
)

var (
	banTopo    bool
	banMetrics bool
	banBw      bool
	//dataMutex  sync.Mutex
)

func initRoutes() {
	http.HandleFunc("/", index)

	http.HandleFunc("/topology", func(w http.ResponseWriter, r *http.Request) {
		switch r.Method {
		case http.MethodGet:
			getTopology(w, r)

		case http.MethodPost:
			addTopology(w, r)
			banTopo = true
			//algorithmBest(banBw, banTopo, banMetrics)

		default:
			w.WriteHeader(http.StatusMethodNotAllowed)
			fmt.Fprintf(w, "Method not allowed")
			return
		}
	})

	http.HandleFunc("/bw", func(w http.ResponseWriter, r *http.Request) {
		switch r.Method {
		case http.MethodGet:
			getBw(w, r)

		case http.MethodPost:
			addBw(w, r)
			banBw = true
			//algorithmBest(banBw, banTopo, banMetrics)

		default:
			w.WriteHeader(http.StatusMethodNotAllowed)
			fmt.Fprintf(w, "Method not allowed")
			return
		}
	})

	http.HandleFunc("/metrics", func(w http.ResponseWriter, r *http.Request) {
		switch r.Method {
		case http.MethodGet:
			getMetrics(w, r)

		case http.MethodPost:
			addMetrics(w, r)
			banMetrics = true
			//algorithmBest(banBw, banTopo, banMetrics)

		default:
			w.WriteHeader(http.StatusMethodNotAllowed)
			fmt.Fprintf(w, "Method not allowed")
			return
		}
	})

	http.HandleFunc("/routes", func(w http.ResponseWriter, r *http.Request) {
		switch r.Method {
		case http.MethodGet:
			getRouteGlobal(w, r)
			return

		default:
			w.WriteHeader(http.StatusMethodNotAllowed)
			fmt.Fprintf(w, "Method not allowed")
			return
		}
	})

	http.HandleFunc("/result/", func(w http.ResponseWriter, r *http.Request) {
		id := strings.TrimPrefix(r.URL.Path, "/result/")
		fmt.Println("id: ", id)
		switch r.Method {
		case http.MethodGet:
			getResult(w, r, id)

		default:
			w.WriteHeader(http.StatusMethodNotAllowed)
			fmt.Fprintf(w, "Method not allowed")
			return
		}
	})
}
