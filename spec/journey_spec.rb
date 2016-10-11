require 'journey'

describe Journey do
  let(:station_entered) { double(:station) }
  subject(:journey) { described_class.new }
  let(:station_exited) { double(:station) }

  it 'collects the entry station' do
    journey = described_class.new(station_entered)
    expect(journey.entry_station).to eq station_entered
  end

  describe '#complete?' do
    it 'is marked as false when a journey starts' do
      journey = Journey.new(station_entered)
      expect(journey).not_to(be_complete)
    end
    it 'is marked as true when a journey finishes' do
      journey = Journey.new(station_entered)
      journey.finish(station_exited)
      expect(journey).to(be_complete)
    end
    it 'is marked as false if only exit station is provided' do
      journey.finish(station_exited)
      expect(journey).not_to(be_complete)
    end
  end
  describe '#finish' do
    it 'captures the exit station when a journey ends' do
      journey.finish(station_exited)
      expect(journey.exit_station).to(eq(station_exited))
    end
    it 'expects journey to receive fare' do
      expect(journey).to receive(:fare)
      journey.finish(station_exited)
    end
  end

  describe '#fare' do
    it 'sets the cost of an incomplete journey with only a starting station' do
      journey = Journey.new(station_entered)
      expect(journey.fare).to eq described_class::PENALTY_FARE
    end
    it 'sets the cost of an incomplete journey with only a finishing station' do
      journey.finish(station_exited)
      expect(journey.fare).to eq described_class::PENALTY_FARE
    end
  end

  describe '#refund_amount' do
    it 'sets the refund amount for a completed journey' do
      journey = Journey.new(station_entered)
      journey.finish(station_exited)
      expect(journey.refund_amount).to(eq(5))
    end
  end
end
