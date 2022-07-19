using Graph: findEdges, AdjList
@enum Color begin
  White
  Grey
  Black
end

function dijkstra(graph::UnDirectedGraph{T}, startvertex::T, endvertex::T) where T
  distancemap = Dict{T, Number}()
  visitedmap = Dict{T, Color}()

  for adjlist in graph.adjlists
    visitedmap[adjlist.vertex] = White
    distancemap[adjlist.vertex] = Inf
  end

  visitedmap[startvertex] = Black
  distancemap[startvertex] = 0

  for edge in findEdges(graph, startvertex)
    visitedmap[edge.vertex] = Grey
    distancemap[edge.vertex] = edge.weight
  end

  flag = all(x -> x[2] == Black, collect(visitedmap))
  while !flag

    adjlists = filter(adjlist -> visitedmap[adjlist.vertex] == Grey, graph.adjlists)

    # here I can use heap
    heap = BinaryHeap(AdjList{T}, (adjlist, other) -> other.vertex - adjlist.vertex)
    for adjlist in adjlists
      push!(heap, adjlist)
    end

    minvertex = extract!(heap).vertex
    # minvertex = sort(adjlists, by = adjlist -> adjlist.vertex) |> first |> x -> x.vertex
    visitedmap[minvertex] = Black

    edges = filter(edge -> visitedmap[edge.vertex] != Black, findEdges(graph, minvertex))

    for edge in edges
      visitedmap[edge.vertex] = Grey
      distancemap[edge.vertex] = min(distancemap[edge.vertex],
                                     distancemap[minvertex] + edge.weight)
    end

    flag = all(x -> x[2] == Black, collect(visitedmap))
  end
  
  return distancemap[endvertex]
end