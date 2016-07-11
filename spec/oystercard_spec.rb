require 'oystercard'

describe Oystercard do
  subject { described_class.new }

  describe "balance" do
    it "is expected to return a float" do
      expect(subject.balance).to eq(0)
    end
  end

  describe "top_up" do
    it "is expected to top up the oystercard by a specified amount" do
      subject.top_up(5)
      expect{subject.deduct(3)}.to change{ subject.balance }.by(-3)
    end

    it "will raise an error if card limit reached" do
      maximum_balance = Oystercard::MAXIMUM_BALANCE
      subject.top_up(maximum_balance)
      expect {subject.top_up(1)}.to raise_error "Unable to top up: £#{maximum_balance} limit exceeded"
    end
  end

  describe "deduct" do
    it "is expected to deduct the oysetercard by a specified amount" do
      subject.top_up(5)
      subject.deduct(1)
      expect(subject.balance).to eq(4)
    end
  end

end
