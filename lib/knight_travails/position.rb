module KnightTravails
  class Position
    attr_reader :row, :column

    def self.from_array(array)
      array => row, column
      new(row, column)
    end

    def initialize(row, column)
      @row = row
      @column = column
    end

    VALID_RANGE = (0...8)

    KNIGHT_JUMP_OFFSETS = [
      [1, 2], [1, -2], [-1, 2], [-1, -2],
      [2, 1], [2, -1], [-2, 1], [-2, -1]
    ].map { Position.from_array it }.freeze

    def to_a = [row, column]

    def ==(other)
      other.is_a?(Position) && row == other.row && column == other.column
    end
    alias eql? ==

    def to_s = to_a.join(", ")

    def +(other) = Position.new(row + other.row, column + other.column)

    def knight_jumps
      KNIGHT_JUMP_OFFSETS.map { it + self }.select(&:valid?)
    end

    def valid? = to_a.all?(VALID_RANGE)
  end
end
