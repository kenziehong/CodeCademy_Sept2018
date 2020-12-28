// package main

// import "fmt"

// type Node struct {
// 	Value int
// }

// type Queue struct {
// 	nodes []*Node
// 	size  int
// 	head  int
// 	tail  int
// 	count int
// }

// // NewQueue returns a new queue with the given initial size.
// func NewQueue(size int) *Queue {
// 	return &Queue{
// 		nodes: make([]*Node, size),
// 		size:  size,
// 	}
// }

// // Push adds a node to the queue
// func (q *Queue) Push(n *Node) {
// 	if q.head == q.tail && q.count > 0 {
// 		fmt.Println(1)
// 	}

// 	q.nodes[q.tail] = n
// 	q.tail = (q.tail + 1) % len(q.nodes)
// 	q.count++
// }

// // Pop removes and returns a node from the queue in first to last order
// func (q *Queue) Pop() *Node {
// 	if q.count == 0 {
// 		return nil
// 	}

// 	node := q.nodes[q.head]
// 	q.head = (q.head + 1) % len(q.nodes)
// 	q.count--
// 	return node
// }

// func main() {
// 	// fmt.Println(2, 3)
// 	q = NewQueue()
// 	q.Push(&Node({5}))
// 	q.Push(&Node({2}))
// 	q.Push(&Node({1}))
// 	q.Pop()
// 	q.Push(&Node({6}))
// 	q.Pop()
// 	q.Push(&Node({3}))
// }
