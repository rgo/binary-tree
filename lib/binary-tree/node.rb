class Node
  attr_accessor :data, :left, :right

  def initialize(data=nil)
    @data  = data
    @left  = nil
    @right = nil
  end

  def insert(node)
    if data.nil?
      self.data = node.data
      return  self
    end

    if node.data < data
      self.left = Node.new if left.nil?
      self.left.insert(node)
    elsif node.data > data
      self.right = Node.new if right.nil?
      self.right.insert(node)
    end
  end

  def search(node_data)
    return nil if data.nil?

    if node_data == data
      return self
    elsif node_data < data
      left.search(node_data)
    elsif node_data > data
      right.search(node_data)
    end
  end
end
