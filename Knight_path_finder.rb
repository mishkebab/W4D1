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
        arr.each do |pos|
            if !@considered_positions.include?(pos)
                @considered_positions << pos
                new_moves << pos
            end
        end
        new_moves
    end 

    def children(node)
        children_vals = new_move_positions(node.value)
        children_vals.each do |val|
            child = PolyTreeNode.new(val)
            node.add_child(child)
            child.parent = node
        end 
    end 
    


    def build_move_tree(@root_node, end_pos)
        queue = [@root_node]
        until queue.empty?
            el = queue.shift
            if el.value == end_pos
                return el
            else 
                ele.children.each {|child|}
            end 
        

    end 
end 
        