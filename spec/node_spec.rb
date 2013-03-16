require 'spec_helper'

describe Node do
  context "on create" do
    it "should store data" do
      node = Node.new(42)

      node.data.should eq 42
    end
  end
end
