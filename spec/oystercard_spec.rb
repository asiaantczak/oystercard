require 'oystercard'

describe Oystercard do
  let(:oystercard) { Oystercard.new }
  let(:entry_station) { double :entry_station }
  let(:exit_station) { double :exit_station}
  let(:journey) { double :journey}

  describe '#balance' do
    it 'should return the balance' do
      expect(oystercard.balance).to eq DEFAULT_BALANCE
    end
  end

  describe '#initialise' do
    it 'should have #list_of_journeys as an empty hash' do
      expect(subject.list_of_journeys).to be_empty
    end
  end


describe '#top_up' do
  it 'should return correct balance when topped up' do
    expect { oystercard.top_up(10) }.to change { oystercard.balance }.by(10)
  end

  it 'should raise error if total exceeds max limit' do
    expect { oystercard.top_up(100) }.to raise_error("Cannot top up as balance exceeds maximum limit.")
  end
end

describe '#touch_in' do
  it 'should raise an error message if balance on #touch_in is less than £1' do
    expect { subject.touch_in(entry_station) }.to raise_error 'Insufficient funds for a journey'
  end

  it 'deducts penalty fare on double touch in' do
    oystercard.instance_variable_set(:@balance, 20)
    oystercard.touch_in(entry_station)
    expect { oystercard.touch_in(entry_station)}.to change { oystercard.balance }.by(-Journey::PENALTY_FARE)

  end

  context 'changes caused by touch_in' do
    before(:each) do
      subject.instance_variable_set(:@balance, 20)
    end
    it 'should change in_journey? on touch_in' do
      subject.touch_in(entry_station)
      expect(subject).to be_in_journey
    end

  end

end

describe '#touch_out' do

  it 'should deduct minimum fare upon #touch_out if journey is complete' do
    oystercard.instance_variable_set(:@balance, 20)
    oystercard.touch_in(entry_station)
    expect { oystercard.touch_out(exit_station) }.to change { oystercard.balance }.by(-Journey::MINIMUM_FARE)
  end
  it 'should store exit_station on touch_out' do
    subject.instance_variable_set(:@balance, 20)
    subject.touch_in(entry_station)
    subject.touch_out(exit_station)
    expect(subject.list_of_journeys.last[:exit]).to eq exit_station
  end

end

  context 'touching in and out' do
    before(:each) do
      subject.instance_variable_set(:@balance, 20)
      subject.touch_in(entry_station)
      subject.touch_out(exit_station)
    end

    it 'should store one journey' do
      expect(subject.list_of_journeys.length).to eq 1
    end
  end

end
