require 'journey'

describe Journey do
  let(:card) {Oystercard.new}
  let(:entry_station) { instance_double Station, name: "Liverpool Street", zone: 1 }
  let(:exit_station) { instance_double Station, name: "Paddington Station", zone: 2 }
  let(:journey) {described_class.new(entry_station)}


  describe '#initialize' do
    it 'stores an entry_station on touch in' do
      card.top_up(5)
      card.touch_in(entry_station)
      expect(journey.entry_station).to eq(entry_station)
    end
  end

  describe '#finish journey' do
    it 'stores an exit station' do
      journey.finish_journey(exit_station)
      expect(journey.instance_variable_get(:@exit_station)).to eq(exit_station)
    end
  end
end
