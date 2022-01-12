# frozen_string_literal: true

require_relative 'board'
require_relative 'knight'
require_relative 'coordinate_translator'

# problem solver
class KnightTravails
  attr_reader :chessboard, :knight

  include CoordinateTranslator

  def initialize
    @chessboard = Board.new.board_grid
    @knight = Knight.new
  end

  def knight_moves(start, target)
    start_vert = chessboard[to_coordinate(start)]
    start_vert.distance = 0
    queue = [start_vert]
    until queue.empty?
      current = queue.shift
      moves = create_valid_moves(current)
      enqueue(current, moves, queue)
    end
    target_path(target).unshift(start)
  end

  def target_path(target)
    path_collection = []
    current_vertex = chessboard[to_coordinate(target)]
    until current_vertex.pred.nil?
      path_collection << current_vertex.name
      current_vertex = current_vertex.pred
    end
    path_collection.reverse
  end

  def enqueue(current_vertex, move_list, queue)
    move_list.each do |move|
      new_vertex = chessboard[move]
      new_vertex.pred = current_vertex
      new_vertex.distance = current_vertex.distance + 1
      queue << new_vertex
    end
  end

  def create_valid_moves(vertex)
    vert_coord = chessboard.key(vertex)
    move_list = knight.generate_moves(vert_coord)
    move_list.select do |move|
      chessboard.keys.include?(move) && chessboard[move].unvisited?
    end
  end
end

p KnightTravails.new.knight_moves('D4', 'A1') # -> ['D4', 'C2', 'A1']
