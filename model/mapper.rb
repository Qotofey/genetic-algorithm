class Mapper

  def self.bipolar matrix
    matrix.map { |value| Math::tanh value }
  end

  def self.derivative_bipolar matrix
    matrix.map { |value| 1 / Math::cosh(value) ** 2 }
  end

end