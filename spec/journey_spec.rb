require 'journey'
require 'oystercard'

describe Journey do
let(:oystercard) { Oystercard.new }
let(:entry_station) { double :entry_station }
let(:exit_station) { double :exit_station }
  it 'is initially not in a journey' do
    expect(oystercard).not_to be_in_journey
  end

  it 'checks that journeys is empty' do
    expect(oystercard.journeys).to be_empty
  end

  it 'stores the journey' do
    oystercard.top_up(10)
    oystercard.touch_in(entry_station)
    oystercard.touch_out(exit_station)
    expect(oystercard.journeys).to include( { entry: entry_station, exit: exit_station })
  end

end