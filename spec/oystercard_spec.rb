require 'oystercard'

describe Oystercard do
  describe '#initialization' do
    subject { Oystercard.new }
  end

  describe '#class methods' do
    context 'these methods should exist in the class' do
      it { is_expected.to(respond_to(:balance)) }
      it { is_expected.to(respond_to(:top_up)) }
    end

  end

  describe '#balance' do
    context '#new Oystercard initialized' do
      it 'with 0 balance' do
        expect(subject.balance).to(eq(0))
      end
    end
  end
end
