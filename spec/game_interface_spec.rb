require 'game_interface'

describe GameInterface do
  let(:board_mock)    { double :board }

  context '#initialized' do
    it 'with a board' do
      interface = GameInterface.new(board_mock)
      expect(interface.board).to eq board_mock
    end
  end
end
