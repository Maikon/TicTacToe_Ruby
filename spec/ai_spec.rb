require 'ai'
require 'board'
require 'game_interface'

describe Ai do
  let(:ai)             { Ai.new }
  let(:board)          { Board.new }
  let(:player_1)       { double :computer, mark: 'O' }
  let(:player_2)       { double :human, mark: 'X' }
  let(:game_interface) { GameInterface.new(board, player_1, player_2) }

  context '#choose_interface' do
    it 'operates on a given game interface' do
      ai.choose_interface(game_interface)
      expect(ai.interface).to eq game_interface
    end
  end

end
