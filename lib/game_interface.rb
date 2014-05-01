class GameInterface
  attr_reader :board, :player

  def initialize(board, player)
    @board = board
    @player = player
  end
end
