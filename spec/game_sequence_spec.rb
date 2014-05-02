require 'stringio'
require 'game_sequence'
require 'game_interface'

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

  context '#greet_player' do
    it 'prints a greeting message' do
      game.output.stub(:puts) { 'Welcome to Tic Tac Toe.' }
      game.greet_player
    end
  end

  context '#get_name' do
    it 'asks the user for the name' do
      game.output.stub(:puts) { 'What shall I call you today?' }
      game.input.stub(:gets) { 'joe' }
      expect(game.get_name).to eq 'Joe'
    end
  end

  context '#get_mark' do
    it 'gets the mark from the player' do
      game.output.stub(:puts) { "Choose your mark: 'X' or 'O'" }
      game.input.stub(:gets) { 'x' }
      expect(game.get_mark).to eq 'X'
    end
  end
end
