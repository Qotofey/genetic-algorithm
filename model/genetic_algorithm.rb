# frozen_string_literal: true

class GeneticAlgorithm
  attr_accessor :perceptrons
  attr_accessor :new_individuals

  attr_accessor :sample_list
  attr_accessor :errors
  attr_accessor :size

  def initialize(population_size, sample_list)
    @size = population_size
    @sample_list = sample_list
    @errors = []
    @perceptrons = []
    @new_individuals = []
    (0...@size).each do |_i|
      p = Perceptron.new 2
      p.build 15, 10
      @perceptrons << p
    end
  end

  def predict
    error_big = 0
    (0...@size).each do |i|
      # @errors << (100 / @perceptrons[i].error_learn(@sample_list)) ** 4
      @errors << (1 / @perceptrons[i].error_learn(@sample_list))
      # puts "##{i} - #{@perceptrons[i].error_learn @sample_list} - #{@errors[i]}"
      error_big += @perceptrons[i].error_learn @sample_list
    end

    puts error_big.to_s
  end

  def learn(epochs)
    (0...epochs).each do |_iter|
      predict
      (0...@size / 4).each do |_i|
        @new_individuals << crossbreeding(roulette_selection, roulette_selection)
      end
      (@size / 4...@size).each do |i|
        @new_individuals << @perceptrons
                            .sort_by { |val| val.error_learn(@sample_list) }
                            .reverse[i]
      end
      mutation_weight
      to_power
    end
  end

  private

  def roulette_selection
    error = 0
    @errors.each do |e|
      error += e
    end
    # puts error
    random_val = rand 0...error
    # puts random_val
    start_val = 0
    index_val = 0
    (0...@size).each do |i|
      finish_val = start_val + @errors[i]
      index_val = i
      break if start_val <= random_val && random_val < finish_val

      start_val = finish_val
    end
    index_val
  end

  def crossbreeding(parent_one, parent_two)
    first_perceptron = @perceptrons[parent_one]
    second_perceptron = @perceptrons[parent_two]
    new_individual = Perceptron.new 2
    new_individual.build 15, 10
    # находим точку разрыва
    count_weights = 0
    (0...first_perceptron.count_layers).each do |i|
      count_weights += first_perceptron.layers[i].weights.count
    end
    break_point = rand 0...count_weights # нашли точку разрыва
    break_point_number_layer = 0 # слой в котором находится точка разрыва
    # puts break_point
    first_perceptron.layers.each do |layer|
      break unless break_point >= layer.weights.count

      break_point -= (layer.weights.count - 1)
      break_point_number_layer += 1
    end

    (0...first_perceptron.count_layers).each do |iter|
      first_perceptron.layers[iter].weights.each_with_index do |weight, i, j|
        k = first_perceptron.layers[iter].weights.row_count * i + j

        if iter == break_point_number_layer && break_point <= k
          new_individual.layers[iter].weights.to_a[i][j] = weight
          next
        end
        new_individual.layers[iter].weights.to_a[i][j] = second_perceptron.layers[iter].weights.to_a[i][j]
      end
    end

    new_individual
  end

  def mutation_weight
    new_individuals.each do |pointer_perceptron|
      count_layers = pointer_perceptron.count_layers
      number_layer = rand 0...count_layers
      pointer_weights = pointer_perceptron.layers[number_layer].weights
      i = rand 0...pointer_weights.row_size
      j = rand 0...pointer_weights.column_size
      pointer_perceptron.layers[number_layer].weights.row(i).to_a[j] = rand(-2.5..2.5)
    end
  end

  def to_power
    @perceptrons = []
    @perceptrons = @new_individuals
    @new_individuals = []
    @errors = []
  end
end
