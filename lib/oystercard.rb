class Oystercard

MAXIMUM_BALANCE = 90
MINIMUM_FARE = 1
attr_reader :balance

  def initialize
    @balance = 0
    @in_journey = false
  end

  def top_up(amount)
    fail "Unable to top up: £#{MAXIMUM_BALANCE} limit exceeded" if @balance + amount > MAXIMUM_BALANCE
    @balance += amount
  end

  def touch_in
    fail "Please top up your oystercard" if @balance < MINIMUM_FARE
    @in_journey = true
  end

  def in_journey?
    @in_journey
  end

  def touch_out
    deduct(MINIMUM_FARE)
    @in_journey = false
  end

  private

  def deduct(amount)
    @balance -= amount
  end

end
