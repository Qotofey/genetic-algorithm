require 'matrix'

class Mapper

  def self.bipolar matrix
    m = matrix.map { |value| num_bipolar value }
  end

  def self.derivative_bipolar matrix
    m = matrix.map { |value| num_derivative_bipolar value }
  end

  def self.sigmoid matrix
    m = matrix.map { |value| num_sigmoid value }
  end

  def self.derivative_sigmoid matrix
    m = matrix.map { |value| num_derivative_sigmoid value }
  end


  def self.result_print matrix, num
    puts "Анализ: #{num}"
    i = 0
    matrix.each do |value|
      puts "Число: #{i}; уверенность персептрона: #{(value * 100).round}%"
      i += 1
    end
  end

  def self.charecter_print matrix, num
    print "Число: #{num}; "
    i = 0
    big_val = 0
    big_index = 0
    matrix.each do |val|
      if big_val < val
        big_val = val
        big_index = i
      end
      i += 1
    end
    puts "распознан символ: #{big_index}; уверенность: #{(big_val * 100).round}%"
  end

  private

  def self.num_bipolar x
    y = Math::tanh x
  end

  def self.num_derivative_bipolar x
    y = 1 / (Math::cosh(x) ** 2)
  end

  def self.num_sigmoid x
    y = 1 / (1 + Math::exp(-x))
  end

  def self.num_derivative_sigmoid x
    y = num_sigmoid(x) * (1 - num_sigmoid(x))
  end

end