require "decimal_dollars/money"
require "decimal_dollars/version"

# :undoc
module DecimalDollars
  # Return Money object.
  def self.Money(value)
    Money.new(value)
  end
end
