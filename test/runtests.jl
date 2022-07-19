using Graph, GraphAlgorithm, Test

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
