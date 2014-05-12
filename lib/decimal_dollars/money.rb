require "bigdecimal"
require "delegate"

module DecimalDollars
  # The Money class is designed to handle the money representation of a value.
  # For the most part, it acts like a BigDecimal.
  class Money < DelegateClass ::BigDecimal
    # Create new Money instance
    # @param [Object] value
    # return [DecimalDollars::Money]
    def initialize(value)
      value = round_float(value) if value.is_a?(Float)
      super(value)
    end

    # Define standard operators to return Money objects.
    %w(+ -).each do |method|
      define_method method do |value|
        Money.new(super(Money.new(value)))
      end
    end

    # Divide a Money object by another object.
    # @param [Object] value
    # @return [DecimalDollars::Money]
    def /(value)
      Money.new(super(value))
    end

    # Multiply a Money object by a scalar.
    # @param [Object] value
    # @raise DecimalDollars::Money::InvalidValue if a Money object is passed.
    def *(value)
      raise ArgumentError, 'Money cannot be multiplied by Money' if value.is_a?(Money)
      Money.new(super(value))
    end

    # Stub original ** method.
    # @param [Object] power
    # @raise DecimalDollars::Money::InvalidValue as
    def **(power)
      raise RuntimeError, 'Money cannot be raised to any power'
    end

    # Round the passed float value using the most basic rounding method.
    # @param [Float] value
    # @return [Float]
    def round_float(value)
      (value * 100).round / 100.0
    end
    private :round_float
  end
end
