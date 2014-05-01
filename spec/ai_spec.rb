require 'ai'
require 'board'
require 'game_interface'
require 'spec_helper'

describe Ai do
  let(:ai)             { Ai.new }
  let(:board)          { Board.new }
  let(:current_player)       { double :computer, mark: 'O' }
  let(:opponent)       { double :human, mark: 'X' }
  let(:game_interface) { GameInterface.new(board, current_player, opponent) }

  before(:each) do
    ai.choose_interface(game_interface)
  end

  context '#choose_interface' do
    it 'operates on a given game interface' do
      expect(ai.interface).to eq game_interface
    end
  end

  context '#winning_spot_available?' do
    it 'returns winning spot if one exists' do
      fill_cell(1, current_player.mark)
      fill_cell(3, current_player.mark)
      expect(ai.winning_spot_available?).to eq true
    end
  end

  context '#board_center_available?' do
    it 'returns true if the center of the board is free' do
      expect(ai.board_center_available?).to eq true
      fill_cell(5, opponent.mark)
      expect(ai.board_center_available?).to eq false
    end
  end

  context '#possible_loss?' do
    it 'returns true if the opponent has a winning spot' do
      fill_cell(1, opponent.mark)
      fill_cell(5, current_player.mark)
      fill_cell(3, opponent.mark)
      expect(ai.possible_loss?).to eq true
    end
  end

  context '#diagonal_trap_being_set?' do
    it 'returns true if the opponent can set a diagonal trap' do
      fill_cell(1, opponent.mark)
      fill_cell(9, current_player.mark)
      expect(ai.diagonal_trap_being_set?).to eq false
      fill_cell(5, opponent.mark)
      expect(ai.diagonal_trap_being_set?).to eq true
    end
  end

  context '#alternative_diagonal_trap_being_set?' do
    it 'returns true if the opponent can set an alternative diagonal trap' do
      fill_cell(1, opponent.mark)
      fill_cell(5, current_player.mark)
      expect(ai.alternative_diagonal_trap_being_set?).to eq false
      fill_cell(9, opponent.mark)
      expect(ai.alternative_diagonal_trap_being_set?).to eq true
    end
  end

  context '#opportunity_to_set_trap_exists?' do
    it 'returns true if trap can be set against opponent' do
      fill_cell(1, current_player.mark)
      fill_cell(9, opponent.mark)
      expect(ai.opportunity_to_set_trap_exists?).to eq true
    end
  end

  context '#mark_winning_spot' do
    it 'marks the winning spot in a winning combination' do
      fill_cell(1, current_player.mark)
      fill_cell(9, current_player.mark)
      expect(board).to receive(:set_value_for).with(5, 'O')
      ai.mark_winning_spot
    end
  end

  context '#block_opponent_winning_spot' do
    it 'marks spot that can lead to opponent win' do
      fill_cell(1, opponent.mark)
      fill_cell(5, current_player.mark)
      fill_cell(3, opponent.mark)
      expect(board).to receive(:set_value_for).with(2, 'O')
      ai.block_opponent_winning_spot
    end
  end

  context '#block_diagonal_trap' do
    it 'counters possible diagonal trap' do
      fill_cell(1, opponent.mark)
      fill_cell(5, opponent.mark)
      fill_cell(9, current_player.mark)
      expect(board).to receive(:set_value_for).with(7, 'O')
      ai.block_diagonal_trap
    end
  end

  context '#block_alternative_diagonal_trap' do
    it 'counters possible alternative diagonal trap' do
      fill_cell(1, opponent.mark)
      fill_cell(5, current_player.mark)
      fill_cell(9, opponent.mark)
      expect(board).to receive(:set_value_for).with(2, 'O')
      ai.block_alternative_diagonal_trap
    end
  end

end
