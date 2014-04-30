require 'game_interface'

describe GameInterface do
  let(:board_mock)    { double :board }
  let(:player_1) { double :human }
  let(:player_2) { double :computer }

  context '#initialized' do
    it 'with a board' do
      interface = GameInterface.new(board_mock)
      expect(interface.board).to eq board_mock
    end

    it 'with two players' do
      interface = GameInterface.new(board_mock, player_1, player_2)
      expect(interface.players).to eq [player_1, player_2]
    end
  end
end
