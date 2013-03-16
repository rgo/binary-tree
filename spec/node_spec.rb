require 'spec_helper'

describe Node do
  context "on create" do
    it "should store data" do
      node = Node.new(42)

      node.data.should eq 42
    end
  end

  context "on insert" do
    it "should be root if tree is not initialized(root data is nil)" do
      empty_tree = Node.new
      node       = Node.new(5)

      empty_tree.insert(node)

      empty_tree.data.should eq 5
    end
  end
end
