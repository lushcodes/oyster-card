require_relative 'station'
require_relative 'oystercard'

class Journey
  attr_reader :entry_station, :exit_station
  MIN_FARE = 1
  PENALTY_FARE = 6

  def initialize(entry_station: nil)
    @fare = PENALTY_FARE
    @entry_station = entry_station
  end

  def complete?
    @completed = false
  end

  def fare
  @fare
  end

  def finish(exit_station)
  @exit_station
  @fare = MIN_FARE
  self
  end
end
