# frozen_string_literal: true

require_relative 'lib/knight_travails'

# get inputs
def gets_coord_input
  input = gets.chomp.upcase
  return input if validate_coordinate(input)

  puts 'OOPS! Not a valid board position!'
  puts 'Be sure to use letters A-H for vertical position and numbers 1-8 for horizontal position.'
  puts 'Enter a valid position: '
  gets_coord_input
end

def validate_coordinate(input)
  CoordinateTranslator::FILE_NAMES.include?(input[0]) &&
    CoordinateTranslator::RANK_NAMES.include?(input[1])
end

# script
puts <<~HEREDOC
  This program takes in two positions on a chessboard and outputs the shortest
  list of knight moves necessary to travel between those two positions. When
  entering board positions, be sure to use the chess idiom of letters A-H for the
  horizontal position, and numbers 1-8 for the vertical position.
HEREDOC

puts 'Enter starting position: '
first_position = gets_coord_input
puts 'Enter final position: '
end_position = gets_coord_input
solution = KnightTravails.new.knight_moves(first_position, end_position)
puts "The shortest path between those squares is: #{solution.join(', ')}"
