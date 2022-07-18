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