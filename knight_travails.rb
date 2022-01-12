# frozen_string_literal: true

require_relative 'board'
require_relative 'knight'
require_relative 'coordinate_translator'

# FIXME: Lots of refactoring needed
# TODO: Rethink aspects of OO design
# problem solver
class KnightTravails
  attr_reader :chessboard, :knight

  include CoordinateTranslator
  # placeholder
  # chessboard
  # knight_piece
  # #knight_moves(start, end) method
  def initialize
    @chessboard = Board.new
    @knight = Knight.new
  end

  def knight_moves(start, target)
    start_vert = chessboard.board_grid[to_coordinate(start)]
    start_vert.distance = 0
    queue = [start_vert]
    until queue.empty?
      # placeholder
      current = queue.shift
      moves = create_valid_moves(current)
      moves.each do |move|
        new_vert = chessboard.board_grid[move]
        new_vert.pred = current
        new_vert.distance = current.distance + 1
        queue << new_vert
      end
    end
    p chessboard.board_grid
  end

  def create_valid_moves(vertex)
    vert_coord = chessboard.board_grid.key(vertex)
    unvisited_squares = chessboard.board_grid.select { |_coord, square| square.unvisited? }
    list = knight.generate_moves(vert_coord)
    chessboard.filter_invalid_coords(list).select do |coord|
      unvisited_squares.include?(coord)
    end
  end

  # knight_moves(start, end)
  # translate to 2d coordinates if needed
  # start.distance = 0
  # -> enqueue current coordinate
  # -> for each adjacent -> check if valid with board -> check if unvisited?
  # -> for each valid, unsearched adjacent -> pred = current coordinate
  # -> distance = pred.distance + 1
  # -> dequeue current coordinate
  # -> enqueue adjacents
end

solver = KnightTravails.new
solver.knight_moves('A1', 'B3')

