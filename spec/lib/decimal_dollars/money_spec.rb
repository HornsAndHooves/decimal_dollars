require "spec_helper"

describe DecimalDollars::Money do
  subject { DecimalDollars::Money }

  let(:money) { subject.new(1.2345) }

  it "uses to_d for passed object if it responds to it" do
    obj = "1.2345"
    expect(obj).to receive(:to_d)
    subject.new(obj)
  end

  it "creates new BigDecimal if passed object doesn't respond to to_d" do
    obj = double("1.2345", to_s: "1.2345")
    expect(obj).to receive(:to_s)
    subject.new(obj)
  end

  describe "#corece" do
    it "returns array with reversed operands" do
      expect(money.coerce(2)).to eq([money, 2])
    end
  end

  describe "#to_d" do
    it "returns BigDecimal representation" do
      expect(money.to_d).to eq(BigDecimal('1.2345'))
    end
  end

  describe "#to_f" do
    it "returns Float representation" do
      expect(money.to_f).to eq(BigDecimal('1.2345').to_f)
    end
  end

  describe "#to_s" do
    it "returns String representation" do
      expect(money.to_s).to eq(BigDecimal('1.2345').to_s)
    end
  end
end
