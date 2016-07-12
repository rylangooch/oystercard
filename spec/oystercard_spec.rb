require 'oystercard'

describe Oystercard do
  subject { described_class.new }
  let(:minimum_fare) { Oystercard::MINIMUM_FARE }
  let(:maximum_balance) {Oystercard::MAXIMUM_BALANCE}
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
    context 'when card is fully topped up' do
        before(:example) do
          subject.top_up(maximum_balance)
        end
      it "will raise an error if card limit reached" do
        expect {subject.top_up(minimum_fare)}.to raise_error "Unable to top up: £#{maximum_balance} limit exceeded"
      end
    end

    it "is expected to top up the oystercard by a specified amount" do
      expect{subject.top_up(minimum_fare)}.to change{ subject.balance }.by(minimum_fare)
    end
  end

  describe 'in_journey?' do
    context 'when card is fully topped up' do
      before(:example) do
        subject.top_up(maximum_balance)
      end
      it 'reports whether card is in journey' do
        subject.touch_in
        expect(subject).to be_in_journey
      end
    end
  end

  describe 'touch_out' do
    context 'when card is fully topped up' do
      before(:example) do
        subject.top_up(maximum_balance)
      end
      it 'can change the status of in journey' do
        subject.touch_in
        expect{subject.touch_out}.to change{subject.in_journey?}.to be(false)
      end
      it 'reduces the balance by minimum fare' do
        subject.touch_in
        expect{subject.touch_out}.to change{subject.balance}.by(-minimum_fare)
      end
    end
  end

  describe 'touch_in' do
    context 'when card is fully topped up' do
      before(:example) do
        subject.top_up(maximum_balance)
      end
      it 'can change the status of in journey' do
        expect{subject.touch_in}.to change{subject.in_journey?}.to be(true)
      end
    end

    it 'raises an error when balance is below minimum fare' do
      expect{subject.touch_in}.to raise_error "Please top up your oystercard"
    end

  end

end
