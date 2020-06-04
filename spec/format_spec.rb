describe 'Format' do
  describe '#render' do
    context 'when template string is specified' do
      let(:format) { Format.new('{1}:{2}') }

      it 'renders template with params' do
        expect(format.render(1 => 'aaa', 2 => 'bbb')).to eq 'aaa:bbb'
      end
    end

    context 'when capture is duplicated' do
      let(:format) { Format.new('{1}:{2}:{1}') }

      it 'renders template with params' do
        expect(format.render(1 => 'aaa', 2 => 'bbb')).to eq 'aaa:bbb:aaa'
      end
    end

    context 'when capture name is string' do
      let(:format) { Format.new('{xxx}:{2}:{1}') }

      it 'renders template with params' do
        expect(format.render('xxx' => 'hogehoge', 1 => 'aaa', 2 => 'bbb')).to eq 'hogehoge:bbb:aaa'
      end
    end
  end
end
