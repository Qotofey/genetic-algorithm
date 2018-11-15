require 'matrix'

require_relative 'mapper'

class Layer

  attr_accessor :weights, :inputs, :outputs

  def initialize count_inputs, count_outputs
    @weights = Matrix.build(count_inputs, count_outputs) { rand - 0.5 }
  end

  def predict inputs
    @inputs = inputs
    @outputs = Mapper::bipolar(@inputs * @weights)
  end

  def print_to_console
    puts "Weights - #{self.weights}, Neurons - #{self.neurons}"
  end

end