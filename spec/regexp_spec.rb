require 'spec_helper'

describe 'RegexpMatcher' do
  describe '#match' do
    context 'when specified named capture' do
      it 'returns hash-like object that holds name' do
        matcher = Scan::Matcher::Regexp.new(regexp: '(?<name>\d+)aaa')
        expect(matcher.match('1000aaa')['name']).to eq '1000'
      end
    end

    context 'when specified numbered capture' do
      it 'returns hash-like object that holds number' do
        matcher = Scan::Matcher::Regexp.new(regexp: '(\d+)aaa')
        expect(matcher.match('1000aaa')[1]).to eq '1000'
        expect(matcher.match('1000aaa')[0]).to eq '1000aaa'
      end
    end
  end
end

