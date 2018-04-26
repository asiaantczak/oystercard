class Journey
  MINIMUM_FARE = 1
  PENALTY_FARE = 6

attr_reader :entry_station, :exit_station, :fare

  def initialize(entry_station = nil)
    @entry_station = entry_station
  end

  def end(exit_station = nil)
    @exit_station = exit_station
  end

  def is_complete?
    !!@entry_station && !!@exit_station
  end

  def fare
    if self.is_complete? == true
      @fare = MINIMUM_FARE
    else
      @fare = PENALTY_FARE
    end
  end
end
