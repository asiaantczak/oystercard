class Journey
  MINIMUM_FARE = 1
  PENALTY_FARE = 6

attr_reader :entry_station, :exit_station

  def start(entry_station)
    @entry_station = entry_station
  end

  def end(exit_station = nil)
    @exit_station = exit_station
  end

  def fare
    is_complete? ? MINIMUM_FARE : PENALTY_FARE
  end

  private
  
  def is_complete?
    !!@entry_station && !!@exit_station
  end

end
