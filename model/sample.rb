# frozen_string_literal: true

class Sample
  attr_accessor :inputs, :expected

  def initialize(inputs, expected)
    @inputs = inputs
    @expected = expected
  end
end
