require __dir__ << "/decimal_dollars/money"
require __dir__ << "/decimal_dollars/version"

# :undoc
module DecimalDollars
  # Return Money object.
  def self.money(value)
    Money.new(value)
  end
end
