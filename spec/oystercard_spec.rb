require 'oystercard'

describe Oystercard do
  let(:card_with_money) { Oystercard.new(10) }
  let(:trip) { [{ entry_station: station_entered, exit_station: station_exited }] }
  let(:station_entered) { ("Old Street") }
  let(:station_exited) { ("Waterloo") }
  let(:journeys) { double(:journeys) }

  describe 'initialize' do
    it 'creates a new instance of JourneyLog' do
      expect(subject.journeys).is_a(JourneyLog)
    end
  end
    it 'tells your balance is 0' do
        expect(subject.balance).to eq 0
    end
  describe '#top_up' do
   it 'tells you when you top up' do
       expect{subject.top_up(1)}.to change{subject.balance}.by(1)
      end
   end
   it 'tells you there is a £90 limit' do
       maximum_balance = Oystercard::MAXIMUM_BALANCE
       card = Oystercard.new(maximum_balance)
       expect{card.top_up(maximum_balance)}.to raise_error "Card limited to £#{maximum_balance}"
   end

  describe '#touch_in' do
    it 'raises error if balance less than £1 while touching in' do
      expect{subject.touch_in(station_entered)}.to raise_error 'Insufficient balance'
    end
    it 'deducts the penalty fare when a journey is started' do
      call_journey = card_with_money.journey
      #allow(call_journey).to receive :start
      allow(call_journey).to receive(:fare).and_return(6)
      expect { card_with_money.touch_in(station_entered) }.to change {card_with_money.balance}.by(-call_journey.fare)
    end
  end

  describe '#touch_out' do
    it 'charges the penalty fare if only an exit station is provided' do
      allow(card_with_money.journey).to(receive(:finish))
      allow(card_with_money.journey).to(receive(:fare).and_return(6))
      expect{card_with_money.touch_out(station_exited)}.to change {card_with_money.balance}.by(-6)
    end
    it 'refunds the correct amount if both entry and exit stations are present' do
      card_with_money.touch_in(station_entered)
      allow(card_with_money.journey).to(receive(:fare).and_return(6))
      allow(card_with_money.journey).to(receive(:finish))
      allow(card_with_money.journey).to(receive(:refund_amount).and_return(5))
      expect{card_with_money.touch_out(station_exited)}.to change {card_with_money.balance}.by(-1)
    end
  end

end
