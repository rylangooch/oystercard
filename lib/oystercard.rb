class Oystercard
  MAX_BALANCE = 90
  MIN_FARE = 1
  MIN_AMOUNT = 1

  attr_reader :balance
  attr_reader :entry_station
  attr_reader :exit_station
  attr_reader :journeys

  def initialize
    @balance = 0
    @entry_station = nil
    @exit_station = nil
    @journeys = {}
  end

  def top_up(amount)
    raise "Maximum balance of £#{MAX_BALANCE} exceeded" if (@balance + amount) > MAX_BALANCE
    @balance += amount
  end

  def touch_in(station)
    raise "Card needs at least £#{MIN_AMOUNT} to touch in" if @balance < MIN_AMOUNT
    deduct_fare(MIN_FARE)
    @entry_station = station
    @journeys[:entry_station] = entry_station
  end

  def touch_out(exit_station)
    @entry_station = nil
    @exit_station = exit_station
    @journeys[:exit_station] = exit_station
  end

  def in_journey?
    !!@entry_station
  end

  private

  def deduct_fare(fare)
    @balance -= fare
  end
end
