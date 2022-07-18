function kruskalmst(graph::UnDirectedGraph{T}) where T
  # table = Iterators.flatten(
  #   map(adjlist -> map(edge -> ((adjlist.vertex, edge.vertex), edge.weight), adjlist.edges),
  #             graph.adjlists))

  table = []

  for adjlist in graph.adjlists
    item = map(edge -> ((adjlist.vertex, edge.vertex), edge.weight), adjlist.edges)
    for _item in item
      push!(table, _item)
    end
  end

  sort!(table, by=x -> x[2])
  unique!(x -> sort(collect(x[1])), table)

  mst = UnDirectedGraph(T)

  for adjlist in graph.adjlists
    vertex = adjlist.vertex
    insertVertex!(mst, vertex)
  end

  for item in table
    ((startVertex, endVertex), weight) = item
    insertEdge!(mst, startVertex, endVertex, weight)

    if hascycle(mst)
      removeEdge!(mst, startVertex, endVertex)
    end

    if edgeCount(mst) == vertexCount(mst) - 1
      break
    end
  end

  return mst
end