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

end
