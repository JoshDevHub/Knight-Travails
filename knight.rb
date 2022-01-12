# frozen_string_literal: true

# it moves like a knight and ... quacks like a knight?
class Knight
  def generate_moves(coordinate)
    move_coordinates.map do |move|
      [coordinate, move].transpose.map(&:sum)
    end
  end

  def move_coordinates
    x = [2, 2, 1, 1, -1, -1, -2, -2]
    y = [1, -1, 2, -2, 2, -2, 1, -1]
    x.zip(y)
  end
end
