 require 'station'


 describe Station do
  let(:station) { Station.new("name", 0) }
    it 'has a name by default' do
      expect(station.name).to eq("name")
    end
    it 'has a zone by default' do
      expect(station.zone).to eq(0)
    end
 end


