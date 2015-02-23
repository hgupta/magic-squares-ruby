# --------------------------------------------------------
# Program: Magic Square
# Author: Harsh Gupta
# Date: 23 February 2015, Monday
# Reference: http://mathworld.wolfram.com/MagicSquare.html
# --------------------------------------------------------

class MagicSquare
  class << self
    protected :new
    def Factory arg
      order = arg.to_i

      if order == 0 || order == 2
        raise ArgumentError.new('Magic Square cannot be of order 0 or 2')
      end

      case order % 4
      when 0
        DoublyEvenMagicSquare.new order
      when 2
        LuxMagicSquare.new order
      else
        OddMagicSquare.new(order)
      end
    end
  end

  def pp
    digits = @size.to_s.size
    separator = '+' << ('-' * (digits + 2) << '+') * @order << "\n"
    (0...@order).inject(separator) do |s, i|
      (0...@order).inject(s + '|') do |s, j|
        s << " #{self[i, j].to_s.rjust(digits)} |"
      end << "\n#{separator}"
    end
  end

  alias_method :to_s, :pp

  def compute
    raise NoMethodError.new('compute method not defined in factory.')
  end

  def [](i, j)
    raise NoMethodError.new('[] method not defined with row and col arguments')
  end

  def magic_square?
    puts "Square of Order: #{@order}"
    puts "Number of cells in sqaure: #{@size}"

    array = Array.new(@size)
    (0...@order).each do |i|
      (0...@order).each do |j|
        index = self[i,j] - 1
        return false if (index < 0) || (index >= @size) || array[index]
        array[index] = true
      end
    end
    return false unless array.all?

    sum = @order * (@order * @order + 1) / 2

    puts "Magic sum must be: #{sum}"

    (0...@order).each do |i|
      # Sum of Row
      return false if sum != (0...@order).inject(0) { |s, j| s + self[i,j] }

      # Sum of Column
      return false if sum != (0...@order).inject(0) { |s, j| s + self[j,i] }
    end

    # Sum of Diagonal from Upper left to lower right
    return false if sum != (0...@order).inject(0) { |s, i| s + self[i,i] }

    # Sum of Diagonal from upper right to lower left
    return false if sum != (0...@order).inject(0) { |s, i| s +
                                                    self[i, @order - 1 - i] }

    # Everything is OK
    true
  end

  attr_accessor :order, :size
  private
  def initialize order
    @order  = order
    @size   = @order * @order
    compute
  end
end

class OddMagicSquare < MagicSquare
  def compute
    # Siamese Movement order
    @data = Array.new(@size)
    i, j = 0, @order / 2
    (1..@size).each do |value|
      self[i, j] = value
      ii, jj = i - 1, j + 1
      i, j = self[ii, jj] ? [i + 1, j] : [ii, jj]
    end
    self
  end

  def [] i, j
    @data[get_index(i, j)]
  end

  def []= i, j, v
    @data[get_index(i, j)] = v
  end

  def get_index i, j
    (i % @order) * @order + (j % @order)
  end
end

class DoublyEvenMagicSquare < MagicSquare
  def compute
    # Nothing to compute here
  end

  def [](i, j)
    i, j = i % @order, j % @order
    value = (i * @order) + j + 1
    i, j = i % 4, j % 4
    ((i == j) || (i + j == 3)) ? (@size + 1 - value) : value
  end
end

class LuxMagicSquare < MagicSquare
  L = [4, 1, 2, 3]
  U = [1, 4, 2, 3]
  X = [1, 4, 3, 2]

  def initialize order
    @odd_magic_square = MagicSquare::Factory(order / 2)
    super
  end

  def compute
  end

  def [](i, j)
    i, j = i % @order, j % @order
    ii, jj = i / 2, j / 2
    center = @order / 2 / 2
    value = @odd_magic_square[ii, jj]
    case
    when ii < center then L
    when ii == center then (jj == center) ? U : L
    when ii == center+1 then (jj == center) ? L : U
    else X
    end [i%2*2 + j%2] + 4 * (value - 1)
  end
end

if __FILE__ == $0
  puts MagicSquare::Factory(ARGV.shift)#.magic_square?
end
