module KnightTravails
  require_relative "knight_travails/graph"
  require_relative "knight_travails/position"
  require_relative "knight_travails/vertex"

  def self.knight_moves(start, target)
    start_pos = Position.from_array(start)
    target_pos = Position.from_array(target)

    raise Position::InvalidPositionError unless [start_pos, target_pos].all?(&:valid?)

    Graph.path_to_target(
      Vertex.new(start_pos),
      Vertex.new(target_pos)
    )
  end
end
