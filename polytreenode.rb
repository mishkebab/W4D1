class PolyTreeNode

    attr_reader :value, :parent, :children

    def initialize(value, parent=nil, children=[])
        @value = value
        @parent = parent
        @children = children
    end

    def parent=(new_parent)
        if @parent
            @parent.children.delete(self)
        end
        @parent = new_parent
        if @parent && !new_parent.children.include?(self)
            new_parent.children << self
        end
    end

    def add_child(random_node)
        self.children << random_node
        random_node.parent = self
    end

    def remove_child(child_node)
        if !self.children.include?(child_node)
            raise "thats not my baby!"
        end
        self.children.delete(child_node)
        child_node.parent = nil
    end

    def inspect
        "#<Node:#{self.value}>"
    end

    def dfs(target_value)
        return self if self.value == target_value
        return nil if self.children.length == 0     # leaf
        # ele = children.shift
        self.children.each do |child|
            stack = child.dfs(target_value)
            return stack if stack != nil
            # return child.dfs(target_value)
        end
        nil
    end

    def bfs(target_value)
        queue = [self]        
        until queue.empty?
            ele = queue.shift
            if ele.value == target_value
                return ele 
            else
                ele.children.each {|child| queue << child} 
            end
        end 
        nil
    end 
end