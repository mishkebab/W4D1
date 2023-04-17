require_relative "polytreenode"
class KnightPathFinder
    attr_reader :grid, :root_node, :considered_positions
    def initialize(start_pos = [0,0])
        @root_node = PolyTreeNode.new(start_pos)
        @grid = Array.new(8) { Array.new(8) }
        @considered_positions = [start_pos]
    end 

    def self.valid_moves(start_pos)
        valid_pos = []
        row, col = start_pos
        possible_pos = [[row-2, col+1], [row-2, col-1], [row +2, col+1], [row+2, col-1], [row-1, col + 2], [row + 1, col + 2], [row +1, col-2], [row-1, col -2]]
        possible_pos.each do |pos|
            row, col = pos
            if !(row < 0 || row > 7 || col < 0 || col > 7)
                valid_pos << pos 
            end
        end 
        valid_pos
    end 
        
    def new_move_positions(pos)
        arr = KnightPathFinder.valid_moves(pos)
        new_moves = []
        p @considered_positions
        arr.each do |pos|
            if !@considered_positions.include?(pos)
                @considered_positions << pos
                new_moves << pos
            end
        end
        p new_moves
    end 
end 
        