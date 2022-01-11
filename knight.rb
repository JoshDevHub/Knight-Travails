# frozen_string_literal: true

# it moves like a knight and ... quacks like a knight?
class Knight
  def find_moves(coordinate_position)
    [
      coordinate_position + (1 + 2i),
      coordinate_position + (1 - 2i),
      coordinate_position + (2 + 1i),
      coordinate_position + (2 - 1i),
      coordinate_position + (-1 + 2i),
      coordinate_position + (-1 - 2i),
      coordinate_position + (-2 + 1i),
      coordinate_position + (-2 - 1i)
    ]
  end
end
