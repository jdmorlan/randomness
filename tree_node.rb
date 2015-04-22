class TreeNode

  attr_accessor :children, :parent, :data

  def initialize(data, parent=nil)
    @data = data
    @parent = parent
    @children = []
  end

  def add_child(child)
    child.parent = self
    @children << child
  end

  def remove_child(child)
    @children.delete(child)
  end

  def size
    @children.size
  end

  def is_root?
    @parent.nil?
  end

  def siblings
    if self.is_root?
      nil
    else
      @parent.children.reject { |sibling| sibling.equal?(self) }
    end
  end

  def descendents
    @children.map { |child| [child, child.descendents].flatten }
  end

end
