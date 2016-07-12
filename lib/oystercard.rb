class Oystercard
  MAX_BALANCE = 90

  attr_reader :balance
  attr_reader :journey
  alias :in_journey? :journey

  def initialize
    @balance = 0
    @journey = false
  end

  def top_up(amount)
    raise "Maximum balance of £#{MAX_BALANCE} exceeded" if (@balance + amount) > MAX_BALANCE
    @balance += amount
  end

  def deduct_fare(fare)
    @balance -= fare
  end

  def touch_in
    @journey = true
  end

  def touch_out
    @journey = false
  end
end
