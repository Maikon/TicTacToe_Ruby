require 'stringio'
require 'game_interface'

describe GameInterface do
  let(:board_mock)    { double :board }
  let(:opponent)      { double :human }
  let(:interface)     { GameInterface.new(board_mock, opponent) }

  context '#initialized' do
    it 'with a board' do
      expect(interface.board).to eq board_mock
    end

    it 'with a player' do
      expect(interface.player).to eq opponent
    end
  end

  context '#greet_player' do
    it 'prints a greeting message' do
      expect(interface.output).to receive(:puts).with('-----------------------')
      expect(interface.output).to receive(:puts).with('Welcome to Tic Tac Toe!')
      expect(interface.output).to receive(:puts).with('-----------------------')
      interface.greet_player
    end
  end
end
