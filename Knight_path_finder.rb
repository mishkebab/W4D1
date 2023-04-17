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
        end 
    end 
    
    def build_move_tree
        queue = [@root_node]
        until queue.empty?
            el = queue.shift
            children(el)
            el.children.each {|child| queue << child}
        end
    end 

    def find_path(end_pos)
        queue = [@root_node]  
        until queue.empty?
            ele = queue.shift
            if ele.value == end_pos
                return ele
            else
                ele.children.each {|child| queue << child} 
            end
        end 
        nil
    end 

    def trace_path_back(end_pos)
        end_pos = find_path(end_pos)
        path = []
        path << end_pos.value
        until end_pos.parent == @root_node
            path << end_pos.parent.value
            end_pos = end_pos.parent
        end 
        path << @root_node.value
        return path.reverse
    end 

end 
        