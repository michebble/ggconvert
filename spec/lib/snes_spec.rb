require 'snes'

describe Snes do
  let(:subject) { described_class.new }
  describe '.to_raw' do
    context 'when a valid game genie code is provided' do
      it 'converts it to raw', :aggregate_failures do
        expect(subject.to_raw('DDD1-8D94')).to eq('C40A61:00')
        expect(subject.to_raw('D998-776E')).to eq('C35CBE:05')
      end
    end
  end

  xdescribe '.to_bit_string' do
    context 'when a valid game genie code is provided' do
      it 'converts it to bitstring', :aggregate_failures do
        expect(subject.to_bit_string('DDD1-8D94')).to eq(438_354)
        expect(subject.to_bit_string('D998-776E')).to eq(89_863_055)
      end
    end
  end
end
