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
  end
end
