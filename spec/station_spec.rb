require 'station'

describe Station do

  let(:station) {described_class.new("Liverpool Street",1)}

  describe "#initialise" do
    it 'has a #name' do
      expect(station.name).to eq "Liverpool Street"
    end
    it 'has a #zone' do
      expect(station.zone).to eq 1
    end
  end

end
