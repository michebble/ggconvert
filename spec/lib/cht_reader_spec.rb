require_relative '../../lib/cht_reader'

describe ChtReader do
  let(:subject) { described_class.new(path) }
  let(:path) { File.expand_path('../fixtures/Front Mission Series - Gun Hazard (Japan).cht', File.dirname(__FILE__)) }

  let(:expected_code_list) do
    [
      {
        description: '1-Hit Max. Weapon %',
        codes: ['DDD3-5FF4'],
      },
      {
        description: '1-Hit Max. Armor %',
        codes: ['DDD7-8DB4'],
      },
      {
        description: '1-Hit Max. Vernier %',
        codes: ['DDD1-8D94'],
      },
    ]
  end

  describe '.title' do
    it 'returns the file\'s title' do
      expect(subject.title).to eq 'Front Mission Series - Gun Hazard (Japan)'
    end
  end

  describe '.code_list' do
    it 'returns a list of codes with their description' do
      expect(subject.code_list).to eq expected_code_list
    end
  end
end
