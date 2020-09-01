require 'spec_helper'

describe 'DelimiterMatcher' do
  describe '#match' do
    context 'when specified delimiter' do
      it 'returns hash-lik object that holds number' do
        matcher = Scan::Matcher::Delimiter.new(delimiter: ':')
        expect(matcher.match('aaa:bbb:ccc')[1]).to eq 'aaa'
        expect(matcher.match('aaa:bbb:ccc')[0]).to eq 'aaa:bbb:ccc'
      end
    end
  end
end
