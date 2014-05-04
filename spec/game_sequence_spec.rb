require 'stringio'
require 'game_sequence'
require 'game_interface'
require 'ai'

describe GameSequence do
  let(:human)     { double :human }
  let(:computer)  { double :computer }
  let(:board)     { double :board }
  let(:gi)        { GameInterface.new(board, human) }
  let(:game)      { GameSequence.new(gi, computer) }

  it 'sets the game with an interface and an ai' do
    expect(game.interface).to eq gi
    expect(game.ai).to eq computer
  end
  context '#choose_mark' do
    it 'gets the mark from the player' do
      expect(game.output).to receive(:puts).with("Choose your mark: 'X' or 'O'")
      game.input.stub(:gets) { 'x' }
      expect(game.choose_mark).to eq 'X'
    end
  end

  context '#choose_turn' do
    it 'gets and returns the input from the user choosing who goes first' do
      expect(game.output).to receive(:puts).with('Who would you like to go first: 1) You or 2) Computer')
      game.input.stub(:gets) { '1' }
      expect(game.choose_turn).to eq '1'
    end
  end

  context '#choose_move' do
    it 'gets and returns the move the user chooses' do
      expect(game.output).to receive(:puts).with('Please choose a move from the board:')
      expect(board).to receive(:available_moves).and_return([2])
      game.input.stub(:gets) { '2' }
      expect(game.choose_move).to eq 2
    end
  end
end
