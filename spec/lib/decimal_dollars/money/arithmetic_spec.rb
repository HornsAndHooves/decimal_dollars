require "spec_helper"

describe DecimalDollars::Money::Arithmetic do
  subject { DecimalDollars::Money }

  let(:money) { subject.new(1.2345) }

  describe "#-@" do
    it "returns Money with a negative decimal" do
      expect(-money).to      be_an_instance_of(subject)
      expect(-money.to_d).to eq(BigDecimal('-1.2345'))
    end
  end

  %w{ == eql? }.each do |method|
    describe "##{method}" do
      it "raise an ArgumentError if value we compare to is not a Money" do
        expect {
          money.send(method, 1.2345)
        }.to raise_error(ArgumentError, /A money cannot be compared with/)
      end

      it "returns false if objects are not equivalent" do
        expect(money.send(method, subject.new('1.234'))).to be_false
      end

      it "returns true if objects are equivalent" do
        expect(money.send(method, subject.new('1.2345'))).to be_true
      end
    end
  end

  describe "#+" do
    it "adds a value and return Money object" do
      expect(money + 1.01).to eq(subject.new(2.2445))
    end
  end

  describe "#-" do
    it "subtracts a value and return Money object" do
      expect(money - 1.01).to eq(subject.new(0.2245))
    end
  end

  describe "#*" do
    it "raises an ArgumentError if a Money object is passed" do
      expect {
        money * subject.new(2)
      }.to raise_error(ArgumentError, /A money cannot be multiplied by/)
    end

    it "is multipliable by a value and returns Money object" do
      expect(money * 1.01).to eq(subject.new(1.246845))
    end
  end

  describe "#/" do
    it "is divisible by a Money value and return float" do
      expect(money / subject.new('1.01')).to eq(1.2222772277227723)
    end

    it "is divisible by a value and return Money object" do
      expect(money / 1.01).to eq(subject.new(money.to_d / subject.new('1.01').to_d))
    end
  end
end
