require 'journey'
require 'oystercard'
require 'station'

describe Journey do
let(:oystercard) { Oystercard.new }
let(:journey) {Journey.new}
let(:entry_station) { double :entry_station }
let(:exit_station) { double :exit_station }

  it 'checks that journeys is empty' do
    expect(journey.journeys).to be_empty
  end

  it 'stores the journey' do
    journey.log_journey(entry_station, exit_station)
    expect(journey.journeys).to include( { entry: entry_station, exit: exit_station })
  end

end