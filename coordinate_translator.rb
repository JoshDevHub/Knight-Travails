# frozen_string_literal: true

# methods to translate between chess square notation and 2d coordinates
module CoordinateTranslator
  FILE_NAMES = %w[A B C D E F G H].freeze
  RANK_NAMES = %w[1 2 3 4 5 6 7 8].freeze

  def to_square_notation(coordinate)
    file_index = coordinate.real
    rank_index = coordinate.imag
    FILE_NAMES[file_index] + RANK_NAMES[rank_index]
  end

  def to_coordinate(square_notation)
    x, y = square_notation.chars
    FILE_NAMES.index(x) + RANK_NAMES.index(y).i
  end
end
