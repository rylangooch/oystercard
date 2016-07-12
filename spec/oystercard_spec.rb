require 'oystercard'

describe Oystercard do
  describe '#initialization' do
    subject { described_class.new }
  end

  describe '#class methods' do
    context 'these methods should exist in the class:' do
      it { is_expected.to(respond_to(:balance)) }
      it { is_expected.to(respond_to(:top_up).with(1).argument) }
      it { is_expected.to(respond_to(:deduct_fare).with(1).argument) }
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
    context '#top_up should:' do
      it 'top up balance by 5' do
        expect{ subject.top_up(5).to change{ subject.balance }.by(5) }
      end

      it 'not top up if max balance exceeded' do
        max_balance = Oystercard::MAX_BALANCE
        subject.top_up(max_balance)
        expect{ subject.top_up(1) }.to(raise_error("Maximum balance of £#{max_balance} exceeded"))
      end
    end
  end

  describe '#deduct_fare' do
    context '#deduct_fare should:' do
      it 'deduct balance by 5' do
        subject.top_up(10)
        expect{ subject.deduct_fare(5).to change{ subject.balance }.by(-5) }
      end
    end
  end
end
