require 'matrix'
require_relative 'layer'
require_relative 'mapper'


class Perceptron

  attr_accessor :count_layers, :layers

  def initialize count_layers
    @count_layers = count_layers
  end

  def build count_inputs, count_outputs
    @layers = []
    for i in (0...@count_layers)
      if i == @count_layers - 1
        @layers << Layer.new(count_inputs, count_outputs)
      else
        @layers << Layer.new(count_inputs, count_inputs)
      end
    end
  end

  def put inputs
    signals = inputs
    @layers.each do |layer|
      signals = layer.predict signals
    end
    signals
  end

  # вычисление ошибки
  def predict_error sample
    outputs = put sample.inputs

    errors = sample.expected - outputs
    error = 0
    puts errors
    errors.each do |e|
      error += e * e
    end
    error
  end

  # генетический алгоритм


  # обратное распространение ошибки
  def train inputs, expected
    actual = put inputs
    errors = actual - expected
    # TODO: недоделан
    @layers.reverse_each do |layer|
      errors = foreach_all_neurons layer, errors
    end
    e = 0
    errors.each do |error|
      e += error * error
    end
    # puts e
  end

  def foreach_all_neurons layer, errors
    gradients = Mapper::derivative_bipolar layer.outputs
    delta_wights = Matrix.combine(errors, gradients) { |a, b| a * b }

    layer.weights -= (delta_wights.t * layer.inputs * 0.05).t
    return delta_wights * layer.weights.t
  end

end