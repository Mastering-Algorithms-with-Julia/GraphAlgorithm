mutable struct TSPVertex{T}
  data::T
  x::Number
  y::Number
  color::Color
end

TSPVertex(data::T, x::Number, y::Number) where T = TSPVertex{T}(data, x, y, White)
function tsp(vertices::List{TSPVertex{T}}, start::TSPVertex{T}) where T
  tspvertex, tspstart, selection = repeat([nothing], 3)
  found = 0
  x, y = repeat([nothing], 2)

  match = (left, right) -> left.x == right.x && left.y == right.y
  
  tour = List(TSPVertex{T})
  node = findfirst(vertex -> match(vertex, start), vertices)
  if !isnothing(node)
    tspvertex = dataof(node)
    tspstart = tspvertex
    push!(tour, tspvertex)
    x, y = tspvertex.x, tspvertex.y
    tspvertex.color = Black
    found = 1
  else
    return List(TSPVertex{T})
  end
  
  for _ in range(0, length(vertices) - 2)
    minimum = Inf

    for tspvertex in vertices
      if tspvertex.color == White
        distance = sqrt((tspvertex.x - x) ^ 2 + (tspvertex.y - y) ^ 2)
        if distance < minimum
          minimum = distance
          selection = tspvertex
        end
      end
    end

    x, y = selection.x, selection.y
    selection.color = Black

    push!(tour, selection)
  end

  push!(tour, tspstart)
  return tour
end