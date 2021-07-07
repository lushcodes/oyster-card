class Journey

  attr_accessor :entry_station, :exit_station, :journeys

  PENALTY_FARE = 6

  def initialize
    
  end

  def log_journey(entry_station, exit_station)
    @journeys << { entry: entry_station, exit: exit_station }
  end
  
  def fare 
    PENALTY_FARE
  end

end
