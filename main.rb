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


# вывод работы персептрона


# m = Matrix[[1,2,3],[4,5,6],[7,8,9]]
# i = Matrix[[1, 0, 1]]
# m = Matrix.build(3) { rand - 0.5 }
# puts (i * m)
# puts (i * m).map { |x| Math::tanh x }

