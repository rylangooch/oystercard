require 'journey'

describe Journey do
  describe '#initialization' do
    subject { described_class.new }
  end

  let(:card_with_money) { double(:card_with_money) }
  allow(card_with_money).to receive(:touch_in).and_return(:entry_station)

  it { is_expected.to(respond_to(:end_journey)) }

  describe 'start_journey' do
    let(:journey) { {entry_station: entry_station} }
    it 'records the entry station' do
      card_with_money.touch_in(:entry_station)
      expect(subject.journeys).to include journey
    end
  end

  describe 'end_journey' do

  end

end
