require 'stringio'
require 'game_interface'

describe GameInterface do
  let(:board_mock)    { double :board }
  let(:opponent)      { double :human }
  let(:cpu)           { double  }
  let(:output_stream) { StringIO.new }
  let(:input_stream)  { StringIO.new }
  let(:interface)     { GameInterface.new(board_mock, opponent, cpu, output_stream, input_stream) }

  context '#initialized' do
    it 'with a board' do
      expect(interface.board).to eq board_mock
    end

    it 'with a player' do
      expect(interface.player).to eq opponent
    end
  end

  context '#greet_player' do
    it 'prints a greeting message' do
      interface.greet_player
      output_stream.seek(0)
      expect(output_stream.read).to eq "-----------------------\nWelcome to Tic Tac Toe!\n-----------------------\n"
    end
  end

  context '#choose_name' do
    it 'asks the user for the name' do
      interface.input.stub(:gets) { 'joe' }
      interface.choose_name
      output_stream.seek(0)
      expect(output_stream.read).to eq "What shall I call you today?\n"
      expect(interface.choose_name).to eq 'Joe'
    end
  end

  context '#choose_mark' do
    it 'gets the mark from the player' do
      interface.input.stub(:gets) { 'x' }
      interface.choose_mark
      output_stream.seek(0)
      expect(output_stream.read).to eq "Choose your mark: 'X' or 'O'\n"
      expect(interface.choose_mark).to eq 'X'
    end
  end

  context '#choose_turn' do
    it 'gets and returns the input from the user choosing who goes first' do
      interface.input.stub(:gets) { '1' }
      interface.choose_turn
      output_stream.seek(0)
      expect(output_stream.read).to eq "Who would you like to go first: 1) You or 2) Computer\n"
      expect(interface.choose_turn).to eq '1'
    end
  end

  context '#choose_move' do
    it 'gets and returns the move the user chooses' do
      interface.input.stub(:gets) { '2' }
      expect(opponent).to receive(:name).and_return('Joe').twice
      expect(board_mock).to receive(:available_moves).and_return([2]).twice
      interface.choose_move
      output_stream.seek(0)
      expect(output_stream.read).to eq "Ok Joe, choose a move from the board:\n"
      expect(interface.choose_move).to eq 2
    end
  end
end
