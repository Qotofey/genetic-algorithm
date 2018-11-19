require 'matrix'

require_relative 'model/perceptron'
require_relative 'model/sample'
require_relative 'model/mapper'

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

sample_list << Sample.new(
    Matrix[[
               1, 1, 1,
               0, 0, 1,
               1, 1, 1,
               0, 0, 1,
               1, 1, 1
           ]],
    Matrix[[0, 0, 0, 1, 0, 0, 0, 0, 0, 0]])

sample_list << Sample.new(
    Matrix[[
               1, 0, 1,
               1, 0, 1,
               1, 1, 1,
               0, 0, 1,
               0, 0, 1
           ]],
    Matrix[[0, 0, 0, 0, 1, 0, 0, 0, 0, 0]])

sample_list << Sample.new(
    Matrix[[
               1, 1, 1,
               1, 0, 0,
               1, 1, 1,
               0, 0, 1,
               1, 1, 1
           ]],
    Matrix[[0, 0, 0, 0, 0, 1, 0, 0, 0, 0]])

sample_list << Sample.new(
    Matrix[[
               1, 1, 1,
               1, 0, 0,
               1, 1, 1,
               1, 0, 1,
               1, 1, 1
           ]],
    Matrix[[0, 0, 0, 0, 0, 0, 1, 0, 0, 0]])

sample_list << Sample.new(
    Matrix[[
               1, 1, 1,
               0, 0, 1,
               0, 1, 0,
               0, 1, 0,
               0, 1, 0
           ]],
    Matrix[[0, 0, 0, 0, 0, 0, 0, 1, 0, 0]])

sample_list << Sample.new(
    Matrix[[
               1, 1, 1,
               1, 0, 1,
               1, 1, 1,
               1, 0, 1,
               1, 1, 1
           ]],
    Matrix[[0, 0, 0, 0, 0, 0, 0, 0, 1, 0]])

sample_list << Sample.new(
    Matrix[[
               1, 1, 1,
               1, 0, 1,
               1, 1, 1,
               0, 0, 1,
               1, 1, 1
           ]],
    Matrix[[0, 0, 0, 0, 0, 0, 0, 0, 0, 1]])

# предварительное предсказание
puts "*** Предсказание ***"
puts perceptron.predict_error sample_list[0]
puts perceptron.predict_error sample_list[1]
puts perceptron.predict_error sample_list[2]
puts perceptron.predict_error sample_list[3]
puts perceptron.predict_error sample_list[4]
puts perceptron.predict_error sample_list[5]
puts perceptron.predict_error sample_list[6]
puts perceptron.predict_error sample_list[7]
puts perceptron.predict_error sample_list[8]
puts perceptron.predict_error sample_list[9]

# обучаем персептрон
puts "*** Тренировка ***"
puts perceptron.error_learn sample_list
# perceptron.learn sample_list, 1500

# вывод работы персептрона
puts "*** Результат ***"
puts perceptron.put sample_list[0].inputs
puts perceptron.put sample_list[1].inputs
puts perceptron.put sample_list[2].inputs
puts perceptron.put sample_list[3].inputs
puts perceptron.put sample_list[4].inputs
puts perceptron.put sample_list[5].inputs
puts perceptron.put sample_list[6].inputs
puts perceptron.put sample_list[7].inputs
puts perceptron.put sample_list[8].inputs
puts perceptron.put sample_list[9].inputs

puts ""
Mapper::result_print perceptron.put(sample_list[0].inputs), 0
Mapper::result_print perceptron.put(sample_list[1].inputs), 1
Mapper::result_print perceptron.put(sample_list[2].inputs), 2
Mapper::result_print perceptron.put(sample_list[3].inputs), 3
Mapper::result_print perceptron.put(sample_list[4].inputs), 4
Mapper::result_print perceptron.put(sample_list[5].inputs), 5
Mapper::result_print perceptron.put(sample_list[6].inputs), 6
Mapper::result_print perceptron.put(sample_list[7].inputs), 7
Mapper::result_print perceptron.put(sample_list[8].inputs), 8
Mapper::result_print perceptron.put(sample_list[9].inputs), 9

puts ""
Mapper::charecter_print perceptron.put(sample_list[0].inputs), 0
Mapper::charecter_print perceptron.put(sample_list[1].inputs), 1
Mapper::charecter_print perceptron.put(sample_list[2].inputs), 2
Mapper::charecter_print perceptron.put(sample_list[3].inputs), 3
Mapper::charecter_print perceptron.put(sample_list[4].inputs), 4
Mapper::charecter_print perceptron.put(sample_list[5].inputs), 5
Mapper::charecter_print perceptron.put(sample_list[6].inputs), 6
Mapper::charecter_print perceptron.put(sample_list[7].inputs), 7
Mapper::charecter_print perceptron.put(sample_list[8].inputs), 8
Mapper::charecter_print perceptron.put(sample_list[9].inputs), 9

