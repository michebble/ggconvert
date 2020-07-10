require_relative '../../lib/cht_reader'

describe ChtReader do
  let(:subject) { described_class.new(path) }
  let(:path) { File.expand_path('../fixtures/Front Mission Series - Gun Hazard (Japan).cht', File.dirname(__FILE__)) }


  describe '.title' do
    it 'returns the file\'s title' do
      expect(subject.title).to eq 'Front Mission Series - Gun Hazard (Japan)'
    end
  end
end
