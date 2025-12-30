module KnightTravails
  class Graph
    def self.path_to_target(...) = new(...).path_to_target

    def initialize(start, target)
      @queue = [target]
      @visited = {}
      @start = start
    end

    def path_to_target
      bfs if @visited.empty?

      @visited[@start].path_to_target
    end

    private

    def bfs
      until @queue.empty?
        current = @queue.shift
        next if visited?(current)

        visit(current)
        @queue += current.adj_list(:knight_jumps)
      end
    end

    def visited?(vertex) = @visited.key?(vertex)
    def visit(vertex) = @visited[vertex] = vertex
  end
end
