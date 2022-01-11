# frozen_string_literal: true

# A single square position on a chess board
class Square
  attr_accessor :name, :distance, :pred

  def initialize(name, distance = nil, pred = nil)
    @name = name
    @distance = distance
    @pred = pred
  end

  def visited?
    !distance.nil?
  end
end
