class Node
  attr_accessor :data, :left, :right

  MODES = [:preorder, :inorder, :postorder]

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

  def destroy(node_data)
    if node = search(node_data)
      destroy_node(node)
    end
  end

  def to_a(mode = :preorder)
    return nil if self.data.nil?

    method_name = "to_a_" + (MODES.include?(mode) ? mode : :preorder).to_s
    send(method_name)
  end

  protected

  def destroy_node(node)
    destroy_node(node.left) unless node.left.nil?
    destroy_node(node.right) unless node.right.nil?

    node.data = node.left = node.right = nil
  end

  # Pre-order displays root node, left node and then right node
  def to_a_preorder
    tree = []
    tree << self.data
    tree << self.left.to_a_preorder unless self.left.nil?
    tree << self.right.to_a_preorder unless self.right.nil?

    return tree
  end

  # In-order displays left node, root node and then right node
  def to_a_inorder
    tree = []
    tree << self.left.to_a_inorder unless self.left.nil?
    tree << self.data
    tree << self.right.to_a_inorder unless self.right.nil?

    return tree
  end
  #
  # Post-order displays left node, root node and then right node
  def to_a_postorder
    tree = []
    tree << self.left.to_a_postorder unless self.left.nil?
    tree << self.right.to_a_postorder unless self.right.nil?
    tree << self.data

    return tree
  end
end
