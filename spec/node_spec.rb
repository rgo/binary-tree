require 'spec_helper'

describe Node do
  context 'on create' do
    it 'should store data' do
      node = Node.new(42)

      expect(node.data).to eq 42
    end
  end

  context 'on insert' do
    let(:tree) { Node.new(9) }

    it 'should be root if tree is not initialized(root data is nil)' do
      empty_tree = Node.new
      node       = Node.new(5)

      empty_tree.insert(node)

      expect(empty_tree.data).to eq 5
    end

    it 'should be in left side if data is lesser than parent\'s data' do
      node_right = Node.new(12)
      node_left  = Node.new(4)

      tree.insert(node_right)
      expect(tree.left).to be_nil

      tree.insert(node_left)
      expect(tree.left.data).to eq(node_left.data)
    end

    it 'should be in right side if data is greater than parent\'s data' do
      node_right = Node.new(12)
      node_left  = Node.new(4)

      tree.insert(node_left)
      expect(tree.right).to be_nil

      tree.insert(node_right)
      expect(tree.right.data).to eq(node_right.data)
    end
  end

  context 'on search' do
    let(:tree) do
      root = Node.new(9)
      [4, 15, 6, 12, 17, 2].each { |v| root.insert(Node.new(v)) }
      root
    end

    it 'should return nil if tree is not initialized' do
      empty_tree = Node.new

      expect(empty_tree.search(42)).to be_nil
    end

    it 'should return bottom left node' do
      node = tree.search(2)

      expect(node.left).to be_nil
      expect(node.right).to be_nil
      expect(node.data).to eq 2
    end

    it 'should return bottom right node' do
      node = tree.search(17)

      expect(node.left).to be_nil
      expect(node.right).to be_nil
      expect(node.data).to eq 17
    end

    it 'should return top node' do
      node = tree.search(9)

      expect(node.left).to_not be_nil
      expect(node.right).to_not be_nil
      expect(node.data).to eq 9
    end
  end

  context 'on destroy' do
    let(:tree_values) { [4, 15, 6, 12, 17, 2] } # Fixtures more or less
    let(:tree) do
      root = Node.new(9)
      tree_values.each { |v| root.insert(Node.new(v)) }
      root
    end

    it 'should empty the tree if destroy root node' do
      tree.destroy(9)

      tree_values.each do |node_data|
        expect(tree.search(node_data)).to be_nil
      end
    end

    it 'should not be empty if only destroy a branch(specific node)' do
      tree.destroy(15)

      expect(tree.search(15)).to be_nil # Initial node
      expect(tree.search(12)).to be_nil # Children node
      expect(tree.search(17)).to be_nil # Children node

      expect(tree.search(4).data).to eq 4    # Node in other branch
    end
  end

  context 'on print' do
    let(:tree) do
      root = Node.new(9)
      [4, 15, 6, 12, 17, 2].each { |v| root.insert(Node.new(v)) }
      root
    end

    it 'should return an array in pre-order (root, left and then right)' do
      expect(tree.to_a).to eq [9, [4, [2], [6]], [15, [12], [17]]]
    end

    it 'should return an array in in-order (root, left and then right)' do
      expect(tree.to_a(:inorder)).to eq [[[2], 4, [6]], 9, [[12], 15, [17]]]
    end

    it 'should return an array in post-order (left, right and then root)' do
      expect(tree.to_a(:postorder)).to eq [[[2], [6], 4], [[12], [17], 15], 9]
    end
  end

end
