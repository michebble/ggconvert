require_relative '../../../lib/snes/game_genie'

describe Snes::GameGenie do
  let(:subject) {  described_class.new(code: game_genie_code) }
  let(:game_genie_code) { 'D998-776E' }

  describe '.decrypt' do
    let(:raw_code) { { address: 'C35CBE', replace: '05', compare: nil } }

    it 'converts it to raw' do
      expect(subject.decrypt).to eq(raw_code)
    end
  end

  xdescribe '.to_bit_string' do
    let(:bit_string) { 89_863_055 }

    it 'converts it to bitstring' do
      expect(subject.to_bit_string).to eq(bit_string)
    end
  end
end
