class Oystercard

  MAXIMUM_BALANCE = 90
  MINIMUM_BALANCE = 1
  attr_reader :balance
  attr_reader :deduct
  def initialize
    @balance = 0
    @card_state = false
  end

  def top_up(amount)
    maximum_balance = MAXIMUM_BALANCE
    fail "Maximum balance of #{maximum_balance} exceeded" if amount + balance > MAXIMUM_BALANCE
    @balance += amount
  end

  def in_journey?
    @card_state
  end
  
  def touch_in
    fail "Insufficient balance to touch in" if balance < 1
    @card_state = true
  
  end

  def touch_out
    deduct(MINIMUM_BALANCE)
    @card_state = false
  end

  private
  
  def deduct(amount)
    @balance -= amount
  end

end