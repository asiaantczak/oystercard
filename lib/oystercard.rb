DEFAULT_BALANCE = 0
MAX_LIMIT = 90
MINIMUM_BALANCE = 1
MINIMUM_CHARGE = 1

class Oystercard
  attr_reader :balance, :list_of_journeys

  def initialize(journey = Journey.new)
    @balance = DEFAULT_BALANCE
    @list_of_journeys = []
    @journey = journey
  end

  def top_up(amount)
    raise "Cannot top up as balance exceeds maximum limit." if max_limit?(amount)
    "Your total balance is £#{@balance += amount}."
  end

  def touch_in(station)
    raise 'Insufficient funds for a journey' if balance < MINIMUM_BALANCE
    if !!@journey.entry_station
      deduct(@journey.fare)
      @list_of_journeys << { entry: @journey.entry_station, exit: @journey.exit_station }
    end
    @journey.start(station)
  end

  def touch_out(station)
    @journey.end(station)
    deduct(@journey.fare)
    @list_of_journeys << { entry: @journey.entry_station, exit: @journey.exit_station }
    @journey = Journey.new
  end

  def in_journey?
      !@journey.nil?
  end

private

  def deduct(amount)
    "Your total balance is £#{@balance -= amount}"
  end

  def max_limit?(amount)
    @balance + amount > MAX_LIMIT
  end
end
