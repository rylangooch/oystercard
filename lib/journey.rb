class Journey
  MIN_FARE = 1

  def initialize
    @journey = {}
  end

  def start(entry_station)
    @journey[:entry_station] = entry_station
  end

  def finish(exit_station)
      @journey[:exit_station] = exit_station
  end

  def journey
    @journey
  end

  def fare
    MIN_FARE
  end

  def complete?
    @journey.has_key?(:entry_station) && @journey.has_key?(:exit_station)
  end

end
