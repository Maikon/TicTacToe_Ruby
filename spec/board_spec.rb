require 'board'

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
end
