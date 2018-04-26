require 'journey'

describe Journey do
  let(:entry_station) { instance_double Station, name: "Liverpool Street", zone: 1 }
  let(:name) { instance_double Station, name: "Liverpool Street"}

  let(:exit_station) { instance_double Station, name: "Paddington Station", zone: 2 }
  let(:journey) {described_class.new(entry_station)}


  describe '#initialize' do
    it 'stores an entry_station' do
      expect(journey.entry_station).to eq entry_station
    end
  end

  describe '#finish journey' do
    it 'stores an exit station' do
      expect(journey.end(exit_station)).to eq exit_station
    end
  end
end
