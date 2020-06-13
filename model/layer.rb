# frozen_string_literal: true

require 'matrix'

require_relative 'mapper'

class Layer
  attr_accessor :weights, :inputs, :outputs

  def initialize(count_inputs, count_outputs)
    @weights = Matrix.build(count_inputs, count_outputs) { rand(-1.0..1.0) }
  end

  def predict(inputs)
    @inputs = inputs
    @outputs = Mapper.relu(@inputs * @weights)
  end

  def print_to_console
    puts "Weights - #{weights}, Neurons - #{neurons}"
  end
end
