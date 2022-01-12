# frozen_string_literal: true

require_relative 'square'
require_relative 'coordinate_translator'

# class that functions as a graph structure
class Board
  attr_reader :board_grid

  include CoordinateTranslator

  def initialize
    @board_grid = {}
    8.times do |y|
      8.times do |x|
        key = [x, y]
        square_name = to_square_notation(key)
        board_grid[key] = Square.new(square_name)
      end
    end
  end

  def filter_invalid_coords(coords_list)
    coords_list.select(&board_grid)
  end
end
