class Oystercard
  MAX_BALANCE = 90
  MIN_FARE = 1
  MIN_AMOUNT = 1

  attr_reader :balance
  attr_reader :station
  attr_reader :journey
  alias :in_journey? :journey

  def initialize
    @balance = 0
    @journey = false
    @station = nil
  end

  def top_up(amount)
    raise "Maximum balance of £#{MAX_BALANCE} exceeded" if (@balance + amount) > MAX_BALANCE
    @balance += amount
  end

  def touch_in(station)
    raise "Card needs at least £#{MIN_AMOUNT} to touch in" if @balance < MIN_AMOUNT
    deduct_fare(MIN_FARE)
    @station = station
    @journey = true
  end

  def touch_out
    @journey = false
  end

  private

  def deduct_fare(fare)
    @balance -= fare
  end
end
