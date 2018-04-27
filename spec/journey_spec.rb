require 'journey'

describe Journey do
  let(:entry_station) { instance_double Station, name: "Liverpool Street", zone: 1 }
  let(:exit_station) { instance_double Station, name: "Paddington Station", zone: 2 }
  let(:journey) { described_class.new }

  describe '#start' do
    it 'stores an entry_station' do
      expect(journey.start(entry_station)).to eq entry_station
    end
  end

  describe '#finish journey' do
    it 'stores an exit station' do
      expect(journey.end(exit_station)).to eq exit_station
    end
  end

  describe  '#calculate_fare' do
    it "calculates fare for the journey if it is complete" do
      allow(subject).to receive(:is_complete?) { true }
      expect(subject.fare).to eq Journey::MINIMUM_FARE
    end

    it "calculates fare for the journey if it is complete" do
      allow(subject).to receive(:is_complete?) { false }
      expect(subject.fare).to eq Journey::PENALTY_FARE
    end
  end

end
