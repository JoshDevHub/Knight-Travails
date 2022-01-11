# frozen_string_literal: true

# A single square position on a chess board
class Square
  attr_reader :name

  def initialize(name)
    @name = name
  end
end
