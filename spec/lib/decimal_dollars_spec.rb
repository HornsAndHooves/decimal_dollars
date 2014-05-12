require "spec_helper"

describe DecimalDollars do
  describe ".Money" do
    it "returns Money object" do
      expect(DecimalDollars.Money(1.23)).to be_an_instance_of(DecimalDollars::Money)
    end
  end
end
