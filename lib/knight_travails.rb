module KnightTravails
  require_relative "knight_travails/graph"
  require_relative "knight_travails/position"
  require_relative "knight_travails/vertex"

  class InvalidPositionInputError < StandardError
    def message
      min, max = Position::VALID_RANGE.minmax
      "Position values must be integers between the range of #{min} and #{max}"
    end
  end

  def self.knight_moves(start, target)
    start_pos = Position.from_array(start)
    target_pos = Position.from_array(target)

    raise InvalidPositionInputError unless [start_pos, target_pos].all?(&:valid?)

    Graph.path_to_target(
      Vertex.new(start_pos),
      Vertex.new(target_pos)
    )
  end
end
