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

  before(:each) do
    ai.choose_interface(game_interface)
  end

  context '#choose_interface' do
    it 'operates on a given game interface' do
      expect(ai.interface).to eq game_interface
    end
  end

  context '#winning_spot_available?' do
    it 'returns true if a winning spot exists' do
      fill_cell(1, player_1.mark)
      fill_cell(3, player_1.mark)
      expect(ai.winning_spot_available?).to eq true
    end
  end

  context '#board_center_available?' do
    it 'returns true if the center of the board is free' do
      expect(ai.board_center_available?).to eq true
      fill_cell(5, player_2.mark)
      expect(ai.board_center_available?).to eq false
    end
  end

  context '#possible_loss?' do
    it 'returns true if the opponent has a winning spot' do
      fill_cell(1, player_2.mark)
      fill_cell(5, player_1.mark)
      fill_cell(3, player_2.mark)
      expect(ai.possible_loss?).to eq true
    end
  end

  context '#diagonal_trap_being_set?' do
    it 'returns true if the opponent can set a diagonal trap' do
      fill_cell(1, player_2.mark)
      fill_cell(9, player_1.mark)
      expect(ai.diagonal_trap_being_set?).to eq false
      fill_cell(5, player_2.mark)
      expect(ai.diagonal_trap_being_set?).to eq true
    end
  end
end
