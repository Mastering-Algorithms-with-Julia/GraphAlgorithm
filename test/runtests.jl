using Graph, GraphAlgorithm, Test, LinkedList

@testset "generate mst" begin
  graph = UnDirectedGraph(Char)
  for ch in 'A':'F'
    insertVertex!(graph, ch)
  end

  insertEdge!(graph, 'A', 'B', 6)
  insertEdge!(graph, 'A', 'D', 5)
  insertEdge!(graph, 'A', 'C', 1)
  insertEdge!(graph, 'B', 'C', 5)
  insertEdge!(graph, 'D', 'C', 5)
  insertEdge!(graph, 'B', 'E', 3)
  insertEdge!(graph, 'C', 'E', 6)
  insertEdge!(graph, 'C', 'F', 4)
  insertEdge!(graph, 'D', 'F', 2)
  insertEdge!(graph, 'E', 'F', 6)

  mst = kruskalmst(graph)
  println(mst)
end

@testset "test dijkstra 1" begin
  graph = UnDirectedGraph(Char)
  for vertex in 'A':'G'
    insertVertex!(graph, vertex)
  end

  insertEdge!(graph, 'A', 'B', 5)
  insertEdge!(graph, 'A', 'C', 2)
  insertEdge!(graph, 'B', 'D', 1)
  insertEdge!(graph, 'B', 'E', 6)
  insertEdge!(graph, 'C', 'D', 6)
  insertEdge!(graph, 'C', 'F', 8)
  insertEdge!(graph, 'D', 'E', 1)
  insertEdge!(graph, 'D', 'F', 2)
  insertEdge!(graph, 'E', 'G', 7)
  insertEdge!(graph, 'F', 'G', 3)

  @show dijkstra(graph, 'A', 'G')
  @show dijkstra(graph, 'A', 'F')
end

@testset "test dijkstra 2" begin
  graph = UnDirectedGraph(Char)

  for vertex in 'A':'G'
    insertVertex!(graph, vertex)
  end

insertEdge!(graph, 'A', 'B', 5)
  insertEdge!(graph, 'A', 'C', 2)
  insertEdge!(graph, 'B', 'D', 5)
  insertEdge!(graph, 'B', 'E', 6)
  insertEdge!(graph, 'C', 'D', 6)
  insertEdge!(graph, 'C', 'F', 8)
  insertEdge!(graph, 'D', 'E', 1)
  insertEdge!(graph, 'D', 'F', 2)
  insertEdge!(graph, 'E', 'G', 7)
  insertEdge!(graph, 'F', 'G', 3)
  

  @show dijkstra(graph, 'A', 'G')
end

@testset "test tsp" begin
  vertices = [
    TSPVertex(0, 2, 1),
    TSPVertex(0, 5, 2),
    TSPVertex(0, 1, 3),
    TSPVertex(0, 4, 3),
    TSPVertex(0, 6, 3),
    TSPVertex(0, 2, 4),
    TSPVertex(0, 5, 5),
  ]

  list = List(TSPVertex{Int})
  for vertex in vertices
    push!(list, vertex)
  end

  tour = tsp(list, vertices[1])
  for vertex in tour
    println(vertex.x, "\t", vertex.y)
  end
end