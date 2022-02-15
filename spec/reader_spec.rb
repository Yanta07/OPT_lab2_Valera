require './lib/reader'

RSpec.describe Reader do
  describe '#Reader' do
    context '.read_action' do
      it 'Input correct choice by user' do
        game = Game.new
        expect do
          allow($stdin).to receive(:gets).and_return('2')
          expect(Reader.new.read_action(game)).to eq nil
        end
      end

      reader = Reader.new
      before do
        allow(reader).to receive(:decision?).and_return(false)
      end

      it 'Error, no such action' do
        expect(reader).to receive(:decision?).exactly(1)
        allow($stdin).to receive(:gets).and_return('20')
        reader.read_action(Game.new)
      end
    end

    context '.decision? true' do
      it { expect(Reader.new.decision?(5)).to eq false }
      it { expect(Reader.new.decision?(20)).to eq true }
    end
  end
end
