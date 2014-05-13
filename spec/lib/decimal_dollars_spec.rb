require "spec_helper"

describe DecimalDollars do
  describe ".money" do
    it "returns Money object" do
      expect(DecimalDollars.money(1.23)).to be_an_instance_of(DecimalDollars::Money)
    end
  end
end
