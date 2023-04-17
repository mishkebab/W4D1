require_relative "polytreenode"
class KnightPathFinder
    attr_reader :grid, :root_node
    def initialize(pos = [0, 0])
        @root_node = PolyTreeNode.new(pos)
        @grid = Array.new(8) { Array.new(8) }

    end 

    def self.valid_moves(start_pos)
        @considered_positions = [start_pos]
        row, col = start_pos
        possible_pos = [[row-2, col+1], [row-2, col-1], [row +2, col+1], [row+2, col-1], [row-1, col + 2], [row + 1, col + 2], [row +1, col-2], [row-1, col -2]]
    end 
        






    def new_move_positions()
    end 

end 
        