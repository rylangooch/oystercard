require 'oystercard'

describe Oystercard do
  describe '#initialization' do
    subject { Oystercard.new }
  end

  describe '#class methods' do
    context 'these methods should exist in the class' do
      it { is_expected.to(respond_to(:balance)) }
    end

  end

  describe '#balance' do
    context '#new card initialized, balance eq 0' do
      it 'Oystercard initializes with 0 balance' do
        expect(subject.balance).to(eq(0))
      end
    end
  end
end
