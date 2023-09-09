package kandoo

import (
	"container/heap"
	"math"
)

type Node struct {
	id   int
	dist int
}

type PriorityQueue []*Node

func (pq PriorityQueue) Len() int { return len(pq) }

func (pq PriorityQueue) Less(i, j int) bool {
	return pq[i].dist < pq[j].dist
}

func (pq PriorityQueue) Swap(i, j int) {
	pq[i], pq[j] = pq[j], pq[i]
}

func (pq *PriorityQueue) Push(x interface{}) {
	node := x.(*Node)
	*pq = append(*pq, node)
}

func (pq *PriorityQueue) Pop() interface{} {
	old := *pq
	n := len(old)
	node := old[n-1]
	*pq = old[0 : n-1]
	return node
}

func findMST(graph [][]int, source int) [][]int {
	n := len(graph)
	dist := make([]int, n)
	prev := make([]int, n)
	visited := make([]bool, n)

	for i := 0; i < n; i++ {
		dist[i] = math.MaxInt32
	}

	dist[source] = 0
	pq := &PriorityQueue{}
	heap.Init(pq)
	heap.Push(pq, &Node{id: source, dist: 0})

	for pq.Len() > 0 {
		node := heap.Pop(pq).(*Node)
		id := node.id

		if visited[id] {
			continue
		}

		visited[id] = true

		for j := 0; j < n; j++ {
			if graph[id][j] != 0 && !visited[j] {
				alt := dist[id] + graph[id][j]
				if alt < dist[j] {
					dist[j] = alt
					prev[j] = id
					heap.Push(pq, &Node{id: j, dist: alt})
				}
			}
		}
	}

	mst := make([][]int, n)

	for i := 0; i < n; i++ {
		mst[i] = make([]int, n)
	}

	for i := 0; i < n; i++ {
		if prev[i] != i {
			mst[prev[i]][i] = graph[prev[i]][i]
			mst[i][prev[i]] = graph[prev[i]][i]
		}
	}
	return mst
}

/*
	func main() {
	graph := [][]int{
		{0, 2, 0, 6, 0},
		{2, 0, 3, 8, 5},
		{0, 3, 0, 0, 7},
		{6, 8, 0, 0, 9},
		{0, 5, 7, 9, 0},
	}
	fmt.Println("The given nodes are:", graph)
	mst := findMST(graph, 0)
	fmt.Println()
	fmt.Println("Minimum Spanning Tree:")
	for _, row := range mst {
		fmt.Println(row)
	}
	}
*/
