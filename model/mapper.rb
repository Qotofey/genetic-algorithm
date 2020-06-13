# frozen_string_literal: true

require 'matrix'

class Mapper
  def self.bipolar(matrix)
    matrix.map { |value| num_bipolar value }
  end

  def self.derivative_bipolar(matrix)
    matrix.map { |value| num_derivative_bipolar value }
  end

  def self.sigmoid(matrix)
    matrix.map { |value| num_sigmoid value }
  end

  def self.derivative_sigmoid(matrix)
    matrix.map { |value| num_derivative_sigmoid value }
  end

  def self.relu(matrix)
    matrix.map { |value| num_relu value }
  end

  def self.derivative_relu(matrix)
    matrix.map { |value| num_derivative_relu value }
  end

  def self.result_print(matrix, num)
    puts "Анализ: #{num}"
    i = 0
    matrix.each do |value|
      puts "Число: #{i}; уверенность персептрона: #{(value * 100).round}%"
      i += 1
    end
  end

  def self.charecter_print(matrix, num)
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

  class << self
    private

    def num_bipolar(value)
      Math.tanh(value)
    end

    def num_derivative_bipolar(value)
      1 / (Math.cosh(value)**2)
    end

    def num_sigmoid(value)
      1 / (1 + Math.exp(-value))
    end

    def num_derivative_sigmoid(value)
      num_sigmoid(value) * (1 - num_sigmoid(value))
    end

    def num_relu(value, k = 1.0)
      return 0 if value.negative?

      value * k
    end

    def num_derivative_relu(value)
      return 0 if value.negative?

      1
    end
  end
end
