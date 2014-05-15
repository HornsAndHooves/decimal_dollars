module DecimalDollars
  class Money
    # Arithmetic operations for Money.
    module Arithmetic

      # Return a negative representation.
      # @return [Money]
      def -@
        Money.new(-@decimal)
      end

      # Check if two Money objects are equal.
      # @param [DecimalDollars::Money] value
      # @return [Boolean]
      # @raise [ArgumentError] If +value+ is NOT a Money.
      def ==(value)
        raise ArgumentError, "A money cannot be compared with a #{value.class.name}." unless value.is_a?(Money)
        @decimal == value.to_d
      end

      # Synonymous with +#==+.
      # @param [DecimalDollars::Money] value
      # @return [Boolean]
      # @see #==
      def eql?(value)
        self == value
      end

      # Add a Money object to the current.
      # @param [DecimalDollars::Money] value +Money+ object to add
      # @return [DecimalDollars::Money]
      def +(value)
        Money.new(@decimal + Money.new(value).to_d)
      end

      # Subtract a Money object from the current.
      # @param [DecimalDollars::Money] value A +Money+ object to add
      # @return [DecimalDollars::Money]
      def -(value)
        Money.new(@decimal - Money.new(value).to_d)
      end

      # Multiply a Money object by a numeric.
      # @param [Numeric] value
      # @raise [ArgumentError] If +value+ is NOT a number.
      def *(value)
        raise ArgumentError, "A money cannot be multiplied by a #{value.class.name}." unless value.is_a?(Numeric)
        Money.new(@decimal * value)
      end

      # Divide a Money object by another object.
      # @param [Numeric] value
      # @return [Float] When +value+ is a Money.
      # @return [DecimalDollars::Money] When +value+ is NOT a Money.
      def /(value)
        if value.is_a?(Money)
          (@decimal / value.to_d).to_f
        else
          Money.new(@decimal / Money.new(value).to_d)
        end
      end

    end
  end
end
