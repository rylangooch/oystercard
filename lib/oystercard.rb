class Oystercard
  MAX_BALANCE = 90

  attr_reader :balance

  def initialize
    @balance = 0
  end

  def top_up(amount)
    raise "Maximum balance of £#{MAX_BALANCE} exceeded" if (@balance + amount) > MAX_BALANCE
    @balance += amount
  end

  def deduct_fare(fare)
    @balance -= fare
  end
end
