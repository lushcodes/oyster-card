require 'oystercard'

describe Oystercard do
  let(:oystercard) { Oystercard.new }
  let(:entry_station) { double :entry_station }
  it 'should have an initial balance of 0' do
    expect(oystercard.balance).to eq(0)
  end

  it 'is initially not in a jounrey' do
    expect(oystercard).not_to be_in_journey
  end

  describe '#top_up' do
    it { is_expected.to respond_to(:top_up).with(1).argument }

    it 'can top up the balance' do
      expect{ oystercard.top_up(1) }.to change { oystercard.balance }.by 1
    end

    it 'raises an error if balance exceeds 90' do
      maximum_balance = Oystercard::MAXIMUM_BALANCE
      oystercard.top_up(maximum_balance)
      expect{ oystercard.top_up(1) }.to raise_error "Maximum balance of #{maximum_balance} exceeded"
    end
  end

  describe '#touch_in' do
    it 'can touch in' do
      oystercard.top_up(Oystercard::MINIMUM_BALANCE)
      oystercard.touch_in(entry_station)
      expect(oystercard).to respond_to(:touch_in).with(1).argument
    end

    it 'will not touch in if below minimum balance' do
      expect{ oystercard.touch_in(entry_station) }.to raise_error "Insufficient balance to touch in"
    end

    it 'expects to store entry_station when touched in' do
      oystercard.top_up(Oystercard::MINIMUM_BALANCE)
      oystercard.touch_in(entry_station)
      expect(oystercard.entry_station).to eq(entry_station)
    end

  end

  describe '#touch_out' do
    it 'can touch out' do
      oystercard.top_up(Oystercard::MINIMUM_BALANCE)
      oystercard.touch_in(entry_station)
      oystercard.touch_out
      expect(oystercard).not_to be_in_journey
    end

    it 'can deduct funds when touched out' do
      expect{ oystercard.touch_out }.to change { oystercard.balance }.by -Oystercard::MINIMUM_BALANCE
  end
  it 'forgets station when touched out' do
    expect(oystercard.touch_out).to eq(nil)
end
end
end