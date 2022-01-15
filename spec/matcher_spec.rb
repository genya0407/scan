describe 'RegexpMatcher' do
  describe '#match' do
    context 'when specified named capture' do
      it 'returns hash-like object that holds name' do
        matcher = Scan::RegexpMatcher.new(regexp: '(?<name>\d+)aaa')
        expect(matcher.match('1000aaa')['name']).to eq '1000'
      end
    end

    context 'when specified numbered capture' do
      it 'returns hash-like object that holds number' do
        matcher = Scan::RegexpMatcher.new(regexp: '(\d+)aaa')
        expect(matcher.match('1000aaa')[1]).to eq '1000'
        expect(matcher.match('1000aaa')[0]).to eq '1000aaa'
      end
    end
  end
end

describe 'DelimiterMatcher' do
  describe '#match' do
    context 'when specified delimiter' do
      it 'returns hash-lik object that holds number' do
        matcher = Scan::DelimiterMatcher.new(delimiter: ':')
        expect(matcher.match('aaa:bbb:ccc')[1]).to eq 'aaa'
        expect(matcher.match('aaa:bbb:ccc')[0]).to eq 'aaa:bbb:ccc'
      end
    end
  end
end
