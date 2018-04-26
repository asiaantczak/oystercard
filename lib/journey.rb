class Journey
  MINIMUM_FARE = 1
  PENALTY_FARE = 6

attr_reader :entry_station, :exit_station
  def initialize(entry_station = nil)
    @entry_station = entry_station
  end

  def end(exit_station = nil)
    @exit_station = exit_station
  end

  def is_complete?
    !!@entry_station && !!@exit_station
  end
end
