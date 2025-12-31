require "delegate"

module KnightTravails
  class Vertex < SimpleDelegator
    attr_accessor :pred

    def initialize(delegate, pred: nil)
      super(delegate)
      @pred = pred
    end

    def adj_list(adj_method)
      public_send(adj_method).map { Vertex.new(it, pred: self) }
    end

    def hash = "#{self.class}: #{self}".hash

    def path_to_target
      path = [self]
      path << path.last.pred while path.last.pred

      path.map(&:to_a)
    end
  end
end
