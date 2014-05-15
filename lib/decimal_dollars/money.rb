require "bigdecimal"
require "bigdecimal/util"

require "decimal_dollars/money/arithmetic"

module DecimalDollars
  # The Money class is designed to handle the money representation of a value.
  # For the most part, it acts like a BigDecimal.
  class Money
    include DecimalDollars::Money::Arithmetic

    # Create new Money instance
    # @param [Object] obj
    # @return [DecimalDollars::Money]
    def initialize(obj)
      @decimal = if obj.respond_to?(:to_d)
                   obj.to_d
                 else
                   BigDecimal(obj.to_s)
                 end
    end

    # Make Money instance handle the operations when arguments order is reversed.
    # @return [Array]
    def coerce(value)
      [self, value]
    end

    # Return decimal representation.
    # @return [BigDecimal]
    def to_d
      @decimal
    end

    # Return float representation.
    # @return [Float]
    def to_f
      @decimal.to_f
    end

    # Return string representation.
    # @return [String]
    def to_s
      @decimal.to_s
    end
  end
end
