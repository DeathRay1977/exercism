require_relative '../spec_helper'

describe Bst do
  it "returns the data when creating a new tree" do
    expect(Bst.new(4).data).to eq(4)
  end

  it "Adds to the left when adding a smaller value" do
     four = Bst.new 4
     four.insert 2
     expect(four.data).to eq(4)
     expect(four.left.data).to eq(2)
     expect(four.right).to eq(nil)
  end

  it "Adds to the left when adding a smaller value using << operator" do
  four = Bst.new 4
  four << 2
  expect(four.data).to eq(4)
  expect(four.left.data).to eq(2)
  expect(four.right).to eq(nil)
end

  it "Adds to the left when adding a duplicate value" do
    four = Bst.new 4
    four.insert 4
    expect(four.data).to eq(4)
    expect(four.left.data).to eq(4)
    expect(four.right).to eq(nil)
  end

  it "Adds to the right when adding a larger value" do
    four = Bst.new 4
    four.insert 5
    expect(four.data).to eq(4)
    expect(four.right.data).to eq(5)
    expect(four.left).to eq(nil)
  end

  it "Adds a new node when both left and right have values" do
    four = Bst.new 4
    four.insert 2
    four.insert 6
    four.insert 3

    expect(four.data).to eq(4)
    expect(four.left.data).to eq(2)
    expect(four.right.data).to eq(6)
    expect(four.left.right.data).to eq(3)
  end

  it "Builds a complex_tree" do
    four = Bst.new 4
    four.insert 2
    four.insert 6
    four.insert 1
    four.insert 3
    four.insert 7
    four.insert 5
    expect(four.data).to eq(4)
    expect(four.left.data).to eq(2)
    expect(four.left.left.data).to eq(1)
    expect(four.left.right.data).to eq(3)
    expect(four.right.data).to eq(6)
    expect(four.right.left.data).to eq(5)
    expect(four.right.right.data).to eq(7)
  end

  it "Iterates over on elelment" do
    expect(record_all_data(Bst.new 4)).to eq([4])
  end

  it "Iterates correctly when adding a smaller element" do
  four = Bst.new 4
  four.insert 2
  expect(record_all_data(four)).to eq([2, 4])
  end

  it "Iterates correctly when adding a larger element" do
    four = Bst.new 4
    four.insert 5
    expect(record_all_data(four)).to eq([4, 5])
  end

  it "iterates correctly over a tree three deep" do
    four = Bst.new 4
    four.insert 2
    four.insert 1
    four.insert 3
    four.insert 6
    four.insert 7
    four.insert 5
    expect(record_all_data(four)).to eq([1, 2, 3, 4, 5, 6, 7])
  end
end
