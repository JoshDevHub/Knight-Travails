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

    class InvalidPositionError < StandardError
      def message
        min, max = VALID_RANGE.minmax
        "Position values must be integers between the range of #{min} and #{max}"
      end
    end

    KNIGHT_JUMP_OFFSETS = [
      [1, 2], [1, -2], [-1, 2], [-1, -2],
      [2, 1], [2, -1], [-2, 1], [-2, -1]
    ].map { Position.from_array it }.freeze

    def to_a = [row, column]

    def ==(other)
      row == other.row && column == other.column
    end
    alias eql? ==

    def hash = "#{self.class}: #{row},#{column}".hash

    def +(other) = Position.new(row + other.row, column + other.column)

    def knight_jumps
      KNIGHT_JUMP_OFFSETS.map { it + self }.select(&:valid?)
    end

    def valid?
      VALID_RANGE.cover?(row) && VALID_RANGE.cover?(column)
    end
  end
end
