class Journey

PENALTY_FARE = 6

def initialize
  @fare = PENALTY_FARE
end

def complete?
@completed = false
end

def fare
 @fare
end

def finish(station)
self
end
end