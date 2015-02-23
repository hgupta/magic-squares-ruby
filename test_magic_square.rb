require "minitest/autorun"
require "./magic_square"

describe "OddMagicSquare" do
  before do
    @order  = 3
    @size   = 9
    @sum    = 15
    @square = MagicSquare::Factory(@order)
  end

  it 'has a size of 9' do
    @square.size.must_equal @size
  end

  it 'has 3 rows with sum 15' do
    (0...@order).each do |i|
      (0...@order).inject(0) { |s, j| s + @square[i, j] }.must_equal @sum
    end
  end

  it 'has 3 columns with sum 15' do
    (0...@order).each do |i|
      (0...@order).inject(0) { |s, j| s + @square[j, i] }.must_equal @sum
    end
  end

  it 'has a diagonal from upper left to lower right with sum 15' do
    (0...@order).inject(0) { |s, i| s + @square[i, i] }.must_equal @sum
  end

  it 'has a diagonal from upper right to lower left with sum 15' do
    (0...@order).inject(0) { |s, i| s + @square[i, @order - 1 - i] }.must_equal @sum
  end
end

describe "DoublyEvenMagicSquare" do
  before do
    @order  = 4
    @size   = 16
    @sum    = 34
    @square = MagicSquare::Factory(@order)
  end

  it 'has a size of 16' do
    @square.size.must_equal @size
  end

  it 'has 4 rows with sum 34' do
    (0...@order).each do |i|
      (0...@order).inject(0) { |s, j| s + @square[i, j] }.must_equal @sum
    end
  end

  it 'has 4 columns with sum 34' do
    (0...@order).each do |i|
      (0...@order).inject(0) { |s, j| s + @square[j, i] }.must_equal @sum
    end
  end

  it 'has a diagonal from upper left to lower right with sum 34' do
    (0...@order).inject(0) { |s, i| s + @square[i, i] }.must_equal @sum
  end

  it 'has a diagonal from upper right to lower left with sum 34' do
    (0...@order).inject(0) { |s, i| s + @square[i, @order - 1 - i] }.must_equal @sum
  end
end

describe "SinglyEvenMagicSquare" do
  before do
    @order  = 6
    @size   = 36
    @sum    = 111
    @square = MagicSquare::Factory(@order)
  end

  it 'has a size of 36' do
    @square.size.must_equal @size
  end

  it 'has 6 rows with sum 111' do
    (0...@order).each do |i|
      (0...@order).inject(0) { |s, j| s + @square[i, j] }.must_equal @sum
    end
  end

  it 'has 6 columns with sum 111' do
    (0...@order).each do |i|
      (0...@order).inject(0) { |s, j| s + @square[j, i] }.must_equal @sum
    end
  end

  it 'has a diagonal from upper left to lower right with sum 111' do
    (0...@order).inject(0) { |s, i| s + @square[i, i] }.must_equal @sum
  end

  it 'has a diagonal from upper right to lower left with sum 111' do
    (0...@order).inject(0) { |s, i| s + @square[i, @order - 1 - i] }.must_equal @sum
  end
end

describe "GivenExampleMagicSquare" do
  before do
    @order  = 5
    @size   = 25
    @sum    = 65
    @square = MagicSquare::Factory(@order)
  end

  it 'has a size of 25' do
    @square.size.must_equal @size
  end

  it 'has 6 rows with sum 65' do
    (0...@order).each do |i|
      (0...@order).inject(0) { |s, j| s + @square[i, j] }.must_equal @sum
    end
  end

  it 'has 6 columns with sum 65' do
    (0...@order).each do |i|
      (0...@order).inject(0) { |s, j| s + @square[j, i] }.must_equal @sum
    end
  end

  it 'has a diagonal from upper left to lower right with sum 65' do
    (0...@order).inject(0) { |s, i| s + @square[i, i] }.must_equal @sum
  end

  it 'has a diagonal from upper right to lower left with sum 65' do
    (0...@order).inject(0) { |s, i| s + @square[i, @order - 1 - i] }.must_equal @sum
  end
end
