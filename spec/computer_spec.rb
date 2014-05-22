require 'computer'
require 'board'
require 'spec_helper'

describe Computer do
  let(:cpu)    { Computer.new }
  let(:player) { double :human, mark: 'X' }
  let(:board)  { Board.new }

  context '#choose_mark_depending_on_opponent' do
    it 'sets the computer mark depending on opponent' do
      expect(cpu.mark).to eq nil
      cpu.choose_mark_depending_on_opponent(player)
      expect(cpu.mark).to eq 'O'
    end
  end

  context '#minimax' do
    it 'returns 4 for the win' do
      cpu.choose_mark_depending_on_opponent(player)
      board.set_turn(cpu.mark)
      fill_cell(1, 'O')
      fill_cell(5, 'X')
      fill_cell(9, 'O')
      fill_cell(3, 'X')
      fill_cell(7, 'O')
      fill_cell(6, 'X')
      expect(cpu.minimax(board)).to eq 4
    end

    it 'returns 6 for the win' do
      cpu.choose_mark_depending_on_opponent(player)
      board.set_turn(player.mark)
      fill_cell(1, 'X')
      fill_cell(3, 'O')
      fill_cell(7, 'X')
      fill_cell(9, 'O')
      fill_cell(5, 'X')
      expect(cpu.minimax(board)).to eq 6
    end

    it "returns 9 to block opponent's win" do
      cpu.choose_mark_depending_on_opponent(player)
      board.set_turn(player.mark)
      fill_cell(1, 'X')
      fill_cell(3, 'O')
      fill_cell(5, 'X')
      expect(cpu.minimax(board)).to eq 9
    end

    it "blocks opponent's diagonal trap" do
      cpu.choose_mark_depending_on_opponent(player)
      board.set_turn(player.mark)
      fill_cell(1, 'X')
      fill_cell(5, 'O')
      fill_cell(9, 'X')
      expect(cpu.minimax(board)).to eq 2
    end

    it "blocks opponent's alternative diagonal trap" do
      cpu.choose_mark_depending_on_opponent(player)
      board.set_turn(player.mark)
      fill_cell(1, 'X')
      fill_cell(9, 'O')
      fill_cell(5, 'X')
      expect(cpu.minimax(board)).to eq 3
    end

    it "blocks opponent's edge trap" do
      cpu.choose_mark_depending_on_opponent(player)
      board.set_turn(player.mark)
      fill_cell(2, 'X')
      fill_cell(5, 'O')
      fill_cell(4, 'X')
      expect(cpu.minimax(board)).to eq 1
    end

    it "blocks opponent's reverse edge trap" do
      cpu.choose_mark_depending_on_opponent(player)
      board.set_turn(player.mark)
      fill_cell(6, 'X')
      fill_cell(5, 'O')
      fill_cell(8, 'X')
      expect(cpu.minimax(board)).to eq 3
      fill_cell(3, 'O')
      fill_cell(7, 'X')
      expect(cpu.minimax(board)).to eq 9
    end

    it "blocks opponent's alternative edge trap" do
      cpu.choose_mark_depending_on_opponent(player)
      board.set_turn(player.mark)
      fill_cell(4, 'X')
      fill_cell(5, 'O')
      fill_cell(8, 'X')
      expect(cpu.minimax(board)).to eq 1
      fill_cell(1, 'O')
      fill_cell(9, 'X')
      expect(cpu.minimax(board)).to eq 7
    end

    it "blocks opponent's reverse diagonal trap" do
      cpu.choose_mark_depending_on_opponent(player)
      board.set_turn(player.mark)
      fill_cell(3, 'X')
      fill_cell(5, 'O')
      fill_cell(7, 'X')
      expect(cpu.minimax(board)).to eq 2
    end

    it "blocks opponent's reverse alternative diagonal trap" do
      cpu.choose_mark_depending_on_opponent(player)
      board.set_turn(player.mark)
      fill_cell(3, 'X')
      fill_cell(7, 'O')
      fill_cell(5, 'X')
      expect(cpu.minimax(board)).to eq 1
      fill_cell(1, 'O')
      fill_cell(4, 'X')
      expect(cpu.minimax(board)).to eq 6
    end
  end
end
