require 'oystercard'

describe Oystercard do
  describe '#initialization' do
    subject { Oystercard.new }
  end

  describe '#class methods' do
    context 'these methods should exist in the class:' do
      it { is_expected.to(respond_to(:balance)) }
      it { is_expected.to(respond_to(:top_up).with(1).argument) }
    end

  end

  describe '#balance' do
    context 'new Oystercard initialized:' do
      it 'with 0 balance' do
        expect(subject.balance).to(eq(0))
      end
    end
  end

  describe '#top_up' do
    context '#top_up can:' do
      it 'top_up balance by 5' do
        expect{ subject.top_up(5).to(change{ subject.balance }.by(5)) }
      end
    end
  end
end
