# frozen_string_literal: true

require 'matrix'
require_relative 'layer'
require_relative 'mapper'

class Perceptron
  attr_accessor :count_layers, :layers

  def initialize(count_layers)
    @count_layers = count_layers
  end

  def build(count_inputs, count_outputs)
    @layers = []
    (0...@count_layers).each do |i|
      @layers << if i == @count_layers - 1
                   Layer.new(count_inputs, count_outputs)
                 else
                   Layer.new(count_inputs, count_inputs)
                 end
    end
  end

  def put(inputs)
    signals = inputs
    @layers.each do |layer|
      signals = layer.predict signals
    end
    signals
  end

  # вычисление ошибки
  def predict_error(sample)
    actual = put sample.inputs

    errors = actual - sample.expected
    error = 0
    errors.each do |e|
      error += e * e
    end
    error
  end

  # генетический алгоритм
  def error_learn(sample_list)
    error = 0
    sample_list.each do |sample|
      error += predict_error sample
    end
    error
  end

  # обратное распространение ошибки
  def train(inputs, expected)
    actual = put(inputs)
    errors = actual - expected
    @layers.reverse_each do |layer|
      errors = foreach_all_neurons layer, errors
    end
    global_err = 0
    errors.each do |error|
      global_err += error * error
    end
    global_err
  end

  def foreach_all_neurons(layer, errors)
    gradients = Mapper.derivative_relu layer.outputs
    delta_weights = Matrix.combine(errors, gradients) { |a, b| a * b }

    layer.weights -= layer.inputs.t * delta_weights * 0.0125
    delta_weights * layer.weights.t
  end

  def learn(sample_list, epochs)
    epochs.times do |i|
      error = 0
      sample_list.each do |sample|
        error += train sample.inputs, sample.expected
      end
      puts "Ошибка[#{i}]: #{error}"
      break if error < 0.3
    end

    max_weight = 0
    min_weight = Float::MAX
    @layers.each do |layer|
      layer.weights.each do |weight|
        max_weight = weight if weight > max_weight
        min_weight = weight if weight < min_weight
      end
    end
    puts "Max weight = #{max_weight}"
    puts "Min weight = #{min_weight}"
  end
end
