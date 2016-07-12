require 'oystercard'

describe Oystercard do
  subject { described_class.new }

  describe 'initialize' do

    it 'is initially not in a journey' do
      expect(subject).not_to be_in_journey
    end
  end

  describe "balance" do
    it "is expected to return a float" do
      expect(subject.balance).to eq(0)
    end
  end

  describe "top_up" do
    context 'card to be fully topped up' do
        before(:example) do
          subject.top_up(Oystercard::MAXIMUM_BALANCE)
        end

      it "is expected to top up the oystercard by a specified amount" do
        expect{subject.deduct(3)}.to change{ subject.balance }.by(-3)
      end

      it "will raise an error if card limit reached" do
        expect {subject.top_up(1)}.to raise_error "Unable to top up: £#{Oystercard::MAXIMUM_BALANCE} limit exceeded"
      end
    end
  end

  describe "deduct" do
    it "is expected to deduct the oysetercard by a specified amount" do
      subject.top_up(5)
      subject.deduct(1)
      expect(subject.balance).to eq(4)
    end
  end

  describe 'in_journey?' do
    it 'reports whether card is in journey' do
      subject.touch_in
      expect(subject).to be_in_journey
    end
  end

  describe 'touch_out' do
    it 'can change the status of in journey' do
      subject.touch_in
      expect{subject.touch_out}.to change{subject.in_journey?}.to be(false)
    end
  end

  describe 'touch_in' do

    it 'can change the status of in journey' do
      expect{subject.touch_in}.to change{subject.in_journey?}.to be(true)
    end

  end

end
