require_relative '../../../lib/snes/game_genie'

describe Snes::GameGenie do
  let(:subject) { described_class.new }

  describe '.to_mister_format' do
    context 'when a valid game genie code is provided' do
      it 'converts it to the mister format', :aggregate_failures do
        expect(subject.to_mister_format('DDD1-8D94')).to eq '00 00 00 00 61 0A C4 00 00 00 00 00 00 00 00 00'
        expect(subject.to_mister_format('D998-776E')).to eq '00 00 00 00 BE 5C C3 00 00 00 00 00 05 00 00 00'
      end
    end
  end

  xdescribe '.to_raw' do
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
