require 'ai'
require 'board'
require 'game_interface'
require 'spec_helper'

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

  context '#winning_spot_available?' do
    it 'returns true if a winning spot exists' do
      ai.choose_interface(game_interface)
      fill_cell(1, player_1.mark)
      fill_cell(3, player_1.mark)
      expect(ai.winning_spot_available?).to eq true
    end
  end
end
