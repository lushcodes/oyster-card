require 'oystercard'

describe Oystercard do

  it 'should have an initial balance of 0' do
    expect(subject.balance).to eq(0)
  end

  it 'is initially not in a jounrey' do
    expect(subject).not_to be_in_journey
  end

  describe '#top_up' do
    it { is_expected.to respond_to(:top_up).with(1).argument }

    it 'can top up the balance' do
      expect{ subject.top_up(1) }.to change { subject.balance }.by 1
    end

    it 'raises an error if balance exceeds 90' do
      maximum_balance = Oystercard::MAXIMUM_BALANCE
      subject.top_up(maximum_balance)
      expect{ subject.top_up(1) }.to raise_error "Maximum balance of #{maximum_balance} exceeded"
    end
  end

  describe '#touch_in' do
    it 'can touch in' do
      subject.top_up(Oystercard::MINIMUM_BALANCE)
      subject.touch_in
      expect(subject).to be_in_journey
    end

    it 'will not touch in if below minimum balance' do
      expect{ subject.touch_in }.to raise_error "Insufficient balance to touch in"
    end
  end

  describe '#touch_out' do
    it 'can touch out' do
      subject.top_up(Oystercard::MINIMUM_BALANCE)
      subject.touch_in
      subject.touch_out
      expect(subject).not_to be_in_journey
    end

    it 'can deduct funds when touched out' do
      expect{ subject.touch_out }.to change { subject.balance }.by -Oystercard::MINIMUM_BALANCE
  end
end
end