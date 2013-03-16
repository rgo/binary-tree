class Node
  attr_accessor :data

  def initialize(data=nil)
    @data  = data
  end

  def insert(node)
    if data.nil?
      self.data = node.data
      return self
    end
  end
end
