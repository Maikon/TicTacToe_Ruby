require 'board'
require 'spec_helper'

describe Board do
  let(:board) { Board.new }

  it 'has a grid with numbers 1 to 9' do
    expect(board.grid).to eq [1, 2, 3,
                              4, 5, 6,
                              7, 8, 9]
  end

  context '#rows' do
    it 'returns the rows' do
      expect(board.rows).to eq [[1, 2, 3],
                                [4, 5, 6],
                                [7, 8, 9]]
    end
  end

  context '#columns' do
    it 'returns the columns' do
      expect(board.columns).to eq [[1, 4, 7],
                                   [2, 5, 8],
                                   [3, 6, 9]]
    end
  end

  context '#diagonals' do
    it 'returns the diagonals' do
      expect(board.diagonals).to eq [[1, 5, 9],
                                     [7, 5, 3]]
    end
  end

  context '#edges' do
    it 'returns the edges' do
      expect(board.edges).to eq [2, 4, 6, 8]
    end
  end

  context '#winning_combinations' do
    it 'returns the winning combinations' do
      expect(board.winning_combinations).to eq board.rows +
                                               board.columns +
                                               board.diagonals
    end
  end

  context '#set_value_for' do
    it 'sets the value of the given cell' do
      board.set_value_for(1, 'X')
      expect(board.grid).to eq ['X', 2, 3,
                                4, 5, 6,
                                7, 8, 9]
    end

    it 'returns false if cell is not free' do
      board.set_value_for(1, 'X')
      expect(board.grid).to eq ['X', 2, 3,
                                4, 5, 6,
                                7, 8, 9]
      expect(board.set_value_for(1, 'O')).to eq false
    end
  end

  context '#available_moves' do
    it 'returns the available moves' do
      board.set_value_for(1, 'X')
      board.set_value_for(5, 'O')
      expect(board.available_moves).to eq [2, 3, 4, 6, 7, 8, 9]
    end

    it 'returns empty array otherwise' do
      full_board_draw
      expect(board.available_moves).to eq []
    end
  end

  context '#winner?' do
    it 'returns true if there is a winner' do
      fill_top_row_with_x
      expect(board.winner?).to eq true
    end
  end

  context '#draw?' do
    it 'returns true if there are no moves left' do
      full_board_draw
      expect(board.draw?).to eq true
    end
  end

  context '#reset_value_for' do
    it 'resets the value for the given cell' do
      fill_cell(1, 'X')
      expect(board.grid).to eq ['X', 2, 3,
                                 4, 5, 6,
                                 7, 8, 9]
      board.reset_value_for(1)
      expect(board.grid).to eq [1, 2, 3,
                                4, 5, 6,
                                7, 8, 9]
    end
  end

  context '#win_for?' do
    it 'returns true if the given player has won' do
      fill_cell(1, 'X')
      fill_cell(2, 'O')
      fill_cell(4, 'X')
      fill_cell(5, 'O')
      expect(board.win_for?('X')).to eq false
      fill_cell(7, 'X')
      expect(board.win_for?('X')).to eq true
    end
  end

  context '#set_turn' do
    it 'sets the mark that goes first' do
      expect(board.current_player).to eq nil
      board.set_turn('O')
      expect(board.current_player).to eq 'O'
    end
  end

  context '#change_turn' do
    it 'changes the turn by setting the mark that goes next' do
      board.set_turn('O')
      expect(board.current_player).to eq 'O'
      board.change_turn
      expect(board.current_player).to eq 'X'
    end
  end
end
