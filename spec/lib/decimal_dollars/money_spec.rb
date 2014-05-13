require "spec_helper"

describe DecimalDollars::Money do
  let(:money) { described_class.new(1.2345) }

  describe "#+" do
    it "adds a value and return Money object" do
      expect(money + 1.01).to be_an_instance_of(described_class)
    end
  end

  describe "#-" do
    it "subtracts a value and return Money object" do
      expect(money - 1.01).to be_an_instance_of(described_class)
    end
  end

  describe "#*" do
    it "is multipliable by a value and returns Money object" do
      expect(money * 1.01).to be_an_instance_of(described_class)
    end

    it "raises an ArgumentError if a Money object is passed" do
      expect {
        money * described_class.new(2)
      }.to raise_error(ArgumentError, 'Money cannot be multiplied by Money')
    end
  end

  describe "#/" do
    it "is divisible by a value and return Money object" do
      expect(money / 1.01).to be_an_instance_of(described_class)
    end
  end

  describe "#**" do
    it "raises a RuntimeError" do
      expect {
        money ** 2
      }.to raise_error(RuntimeError, 'Money cannot be raised to any power')
    end
  end

  describe "#round_float" do
    it "rounds correctly" do
      expect(described_class.new(1.251).to_f).to  eq(1.25)
      expect(described_class.new(1.255).to_f).to  eq(1.25)
      expect(described_class.new(1.2551).to_f).to eq(1.26)
      expect(described_class.new(1.2555).to_f).to eq(1.26)
      expect(described_class.new(1.2556).to_f).to eq(1.26)
      expect(described_class.new(1.256).to_f).to  eq(1.26)
    end
  end
end
