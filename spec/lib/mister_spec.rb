require 'mister'

describe Mister do
  let(:subject) { described_class.new(address: address, compare: compare, replace: replace) }
  let(:address) { 'C35CBE' }
  let(:compare) { nil }
  let(:replace)   { '05' }

  it 'converts it to mister format' do
    expect(subject.format).to eq '00 00 00 00 BE 5C C3 00 00 00 00 00 05 00 00 00'
  end

  context 'when the raw code has includes a compare value' do
    let(:address) { 'FF1CA0' }
    let(:replace)   { 'FF' }
    let(:compare) { 'B5' }
    it 'converts it to mister format' do
      expect(subject.format).to eq '01 00 00 00 A0 1C FF 00 B5 00 00 00 FF 00 00 00'
    end
  end
end
