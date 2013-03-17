require 'spec_helper'

describe Node do
  context "on create" do
    it "should store data" do
      node = Node.new(42)

      node.data.should eq 42
    end
  end

  context "on insert" do
    let(:tree) { Node.new(9) }

    it "should be root if tree is not initialized(root data is nil)" do
      empty_tree = Node.new
      node       = Node.new(5)

      empty_tree.insert(node)

      empty_tree.data.should eq 5
    end

    it "should be in left side if data is lesser than parent's data" do
      node_right = Node.new(12)
      node_left  = Node.new(4)

      tree.insert(node_right)
      tree.left.should be_nil


      tree.insert(node_left)
      tree.left.data.should eq(node_left.data)
    end

    it "should be in right side if data is greater than parent's data" do
      node_right = Node.new(12)
      node_left  = Node.new(4)

      tree.insert(node_left)
      tree.right.should be_nil


      tree.insert(node_right)
      tree.right.data.should eq(node_right.data)
    end
  end

  context "on search" do
    let(:tree) {
      root = Node.new(9)
      [4,15,6,12,17,2].each{ |v| root.insert(Node.new(v)) }
      root
    }

    it "should return nil if tree is not initialized" do
      empty_tree = Node.new

      empty_tree.search(42).should be_nil
    end

    it "should return bottom left node" do
      node = tree.search(2)

      node.left.should be_nil
      node.right.should be_nil
      node.data.should eq 2
    end

    it "should return bottom right node" do
      node = tree.search(17)

      node.left.should be_nil
      node.right.should be_nil
      node.data.should eq 17
    end

    it "should return top node" do
      node = tree.search(9)

      node.left.should_not be_nil
      node.right.should_not be_nil
      node.data.should eq 9
    end
  end

  context "on destroy" do
    let(:tree_values) { [4,15,6,12,17,2] } # Fixtures more or less
    let(:tree) {
      root = Node.new(9)
      tree_values.each{ |v| root.insert(Node.new(v)) }
      root
    }

    it "should empty the tree if destroy root node" do
      tree.destroy(9)

      tree_values.each do |node_data|
        tree.search(node_data).should be_nil
      end
    end

    it "should not be empty if only destroy a branch(specific node)" do
      tree.destroy(15)

      tree.search(15).should be_nil # Initial node
      tree.search(12).should be_nil # Children node
      tree.search(17).should be_nil # Children node

      tree.search(4).data.should eq 4    # Node in other branch
    end
  end

  context "on print" do
    let(:tree) {
      root = Node.new(9)
      [4,15,6,12,17,2].each{ |v| root.insert(Node.new(v)) }
      root
    }

    it "should return an array in pre-order (root, left and then right)" do
      tree.to_a.should eq [9, [4, [2], [6]], [15, [12], [17]]]
    end

    it "should return an array in in-order (root, left and then right)" do
      tree.to_a(:inorder).should eq [[[2], 4, [6]], 9, [[12], 15, [17]]]
    end

  end

end
