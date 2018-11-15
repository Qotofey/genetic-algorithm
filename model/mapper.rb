class Mapper

  def self.activation matrix
    matrix.map { |value| Math::tanh value }
  end

  def self.derivative_activation matrix
    matrix.map { |value| 1 / Math::cosh(value) ** 2 }
  end

end