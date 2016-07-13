class Oystercard
  MAX_BALANCE = 90
  MIN_FARE = 1
  MIN_AMOUNT = 1

  attr_reader :balance
  attr_reader :entry_station

  def initialize
    @balance = 0
    @entry_station = nil
  end

  def top_up(amount)
    raise "Maximum balance of £#{MAX_BALANCE} exceeded" if (@balance + amount) > MAX_BALANCE
    @balance += amount
  end

  def touch_in(station)
    raise "Card needs at least £#{MIN_AMOUNT} to touch in" if @balance < MIN_AMOUNT
    deduct_fare(MIN_FARE)
    @entry_station = station
  end

  def touch_out
    @entry_station = nil
  end

  def in_journey?
    !!@entry_station
  end

  private

  def deduct_fare(fare)
    @balance -= fare
  end
end
