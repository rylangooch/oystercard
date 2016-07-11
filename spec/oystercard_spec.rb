require 'oystercard'

describe Oystercard do
  describe '#initialization' do
    subject { Oystercard.new }
  end

  describe '#class methods' do
    it { is_expected.to(respond_to(:balance)) }
  end

  describe '#balance' do
    it 'Oystercard initializes with 0 balance' do
      expect(subject.balance).to(eq(0))
    end
  end
end
