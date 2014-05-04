require 'ai'
require 'board'
require 'game_interface'
require 'spec_helper'

describe Ai do
  let(:computer)             { double :computer, mark: 'O' }
  let(:human_opponent)       { double :human, mark: 'X' }
  let(:ai)                   { Ai.new }
  let(:board)                { Board.new }
  let(:game_interface)       { GameInterface.new(board, human_opponent) }

  it 'operates on a given game interface' do
    ai.choose_interface(game_interface)
    expect(ai.interface).to eq game_interface
  end

  before(:each) do
    ai.choose_interface(game_interface)
  end

  context '#winning_spot_available?' do
    it 'returns winning spot if one exists' do
      fill_cell(1, computer.mark)
      fill_cell(3, computer.mark)
      expect(ai.winning_spot_available?).to eq true
    end
  end

  context '#board_center_available?' do
    it 'returns true if the center of the board is free' do
      expect(ai.board_center_available?).to eq true
      fill_cell(5, human_opponent.mark)
      expect(ai.board_center_available?).to eq false
    end
  end

  context '#possible_loss?' do
    it 'returns true if the human opponent has a winning spot' do
      fill_cell(1, human_opponent.mark)
      fill_cell(5, computer.mark)
      fill_cell(3, human_opponent.mark)
      expect(ai.possible_loss?).to eq true
    end
  end

  context '#diagonal_trap_being_set?' do
    it 'returns true if the human opponent can set a diagonal trap' do
      fill_cell(1, human_opponent.mark)
      fill_cell(9, computer.mark)
      expect(ai.diagonal_trap_being_set?).to eq false
      fill_cell(5, human_opponent.mark)
      expect(ai.diagonal_trap_being_set?).to eq true
    end
  end

  context '#alternative_diagonal_trap_being_set?' do
    it 'returns true if the human opponent can set an alternative diagonal trap' do
      fill_cell(1, human_opponent.mark)
      fill_cell(5, computer.mark)
      expect(ai.alternative_diagonal_trap_being_set?).to eq false
      fill_cell(9, human_opponent.mark)
      expect(ai.alternative_diagonal_trap_being_set?).to eq true
    end
  end

  context '#opportunity_to_set_trap_exists?' do
    it 'returns true if trap can be set against human opponent' do
      fill_cell(1, computer.mark)
      fill_cell(9, human_opponent.mark)
      expect(ai.opportunity_to_set_trap_exists?).to eq true
    end
  end

  context '#mark_winning_spot' do
    it 'marks the winning spot in a winning combination' do
      fill_cell(1, computer.mark)
      fill_cell(9, computer.mark)
      expect(board).to receive(:set_value_for).with(5, 'O')
      ai.mark_winning_spot
    end
  end

  context '#block_human_opponent_winning_spot' do
    it 'marks spot that can lead to human opponent win' do
      fill_cell(1, human_opponent.mark)
      fill_cell(5, computer.mark)
      fill_cell(3, human_opponent.mark)
      expect(board).to receive(:set_value_for).with(2, 'O')
      ai.block_human_opponent_winning_spot
    end
  end

  context '#block_diagonal_trap' do
    it 'counters possible diagonal trap' do
      fill_cell(1, human_opponent.mark)
      fill_cell(5, human_opponent.mark)
      fill_cell(9, computer.mark)
      expect(board).to receive(:set_value_for).with(7, 'O')
      ai.block_diagonal_trap
    end
  end

  context '#block_alternative_diagonal_trap' do
    it 'counters possible alternative diagonal trap' do
      fill_cell(1, human_opponent.mark)
      fill_cell(5, computer.mark)
      fill_cell(9, human_opponent.mark)
      expect(board).to receive(:set_value_for).with(2, 'O')
      ai.block_alternative_diagonal_trap
    end
  end

  context '#set_diagonal_trap' do
    it 'sets a trap for the human opponent' do
      fill_cell(1, human_opponent.mark)
      fill_cell(5, computer.mark)
      expect(board).to receive(:set_value_for).with(9, 'O')
      ai.set_diagonal_trap
    end
  end

  context '#mark_center' do
    it 'marks center of the board' do
      fill_cell(1, human_opponent.mark)
      expect(board).to receive(:set_value_for).with(5, 'O')
      ai.mark_center
    end
  end

  context '#make_random_move' do
    it 'marks a random cell' do
      fill_cell(1, human_opponent.mark)
      fill_cell(5, computer.mark)
      fill_cell(9, human_opponent.mark)
      fill_cell(2, computer.mark)
      fill_cell(8, human_opponent.mark)
      expect(board).to receive(:set_value_for)
      ai.make_random_move
    end
  end

  context '#edges_trap_being_set?' do
    it 'returns true if the first move in the game is on an edge' do
      fill_cell(2, human_opponent.mark)
      expect(ai.edges_trap_being_set?).to eq false
      fill_cell(5, computer.mark)
      fill_cell(8, human_opponent.mark)
      expect(ai.edges_trap_being_set?).to eq true
    end
  end

  context '#block_edges_trap' do
    it 'blocks possible edges trap by marking a diagonal next to the edge' do
      fill_cell(2, human_opponent.mark)
      expect(board).to receive(:set_value_for).with(1, 'O')
      ai.block_edges_trap
    end
  end
end
