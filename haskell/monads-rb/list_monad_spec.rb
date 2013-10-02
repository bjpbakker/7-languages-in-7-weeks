require_relative 'list_monad'

describe "List Monad" do

  it "wraps a single value" do
    Array.wrap("value").should == ["value"]
  end

  it "passes values to a block" do
    inc = lambda { |n| Array.wrap n + 1 }
    [1,2].pass(&inc).should == [2,3]
  end

  it "passes nested arrays to block" do
    identity = lambda { |v| Array.wrap v }
    [[1,2], [3,4]].pass(&identity).should == [[1,2], [3,4]]
  end

  it "gets zero value" do
    Array.mzero.should == []
  end

end
