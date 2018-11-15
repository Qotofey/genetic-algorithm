require 'matrix'

require_relative 'model/perceptron'
require_relative 'model/sample'

# инициализируем перцептрон
perceptron = Perceptron.new 2
perceptron.build 15, 10

# запоняем обучающую выборку
sample_list = []
sample_list << Sample.new(
    Matrix[[
               1, 1, 1,
               1, 0, 1,
               1, 0, 1,
               1, 0, 1,
               1, 1, 1
           ]],
    Matrix[[1, 0, 0, 0, 0, 0, 0, 0, 0, 0]])

sample_list << Sample.new(
    Matrix[[
               0, 0, 1,
               0, 0, 1,
               0, 0, 1,
               0, 0, 1,
               0, 0, 1
           ]],
    Matrix[[0, 1, 0, 0, 0, 0, 0, 0, 0, 0]])

sample_list << Sample.new(
    Matrix[[
               1, 1, 1,
               0, 0, 1,
               1, 1, 1,
               1, 0, 0,
               1, 1, 1
           ]],
    Matrix[[0, 0, 1, 0, 0, 0, 0, 0, 0, 0]])

# предварительное предсказание
puts perceptron.predict_error sample_list[0]
puts perceptron.predict_error sample_list[1]
puts perceptron.predict_error sample_list[2]

# обучаем персептрон
for i in (0..1000)
  perceptron.train sample_list[0].inputs, sample_list[0].expected
  perceptron.train sample_list[1].inputs, sample_list[1].expected
  perceptron.train sample_list[2].inputs, sample_list[2].expected
end

# вывод работы персептрона
puts perceptron.predict_error sample_list[0]
puts perceptron.predict_error sample_list[1]
puts perceptron.predict_error sample_list[2]

