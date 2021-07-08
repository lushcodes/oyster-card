 require 'station'

 describe Station do
  subject { described_class.new("name", 0)  }

    it 'has a name by default' do
      expect(subject.name).to eq("name")
    end
    it 'has a zone by default' do
      expect(subject.zone).to eq(0)
    end
 end


