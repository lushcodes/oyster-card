class Oystercard

  MAXIMUM_BALANCE = 90
  MINIMUM_BALANCE = 1
  attr_reader :balance, :deduct, :entry_station, :exit_station, :journey_history
  
  def initialize
    @balance = 0
    @card_state = false
    @journey_history = []
  end

  def top_up(amount)
    maximum_balance = MAXIMUM_BALANCE
    fail "Maximum balance of #{maximum_balance} exceeded" if amount + balance > MAXIMUM_BALANCE
    @balance += amount
  end

  def in_journey?
    @card_state
  end
  
  def touch_in(entry_station)
    fail "Insufficient balance to touch in" if balance < 1
    @card_state = true
    @entry_station = entry_station
  
  end

  def touch_out(exit_station)
    deduct(MINIMUM_BALANCE)
    @card_state = false
    @exit_station = exit_station
    @journey_history << { entry_station: entry_station, exit_station: exit_station }
    @entry_station = nil
  end

  private
  
  def deduct(amount)
    @balance -= amount
  end

end