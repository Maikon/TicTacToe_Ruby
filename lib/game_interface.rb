class GameInterface
  attr_reader :board, :players

  def initialize(board, *players)
    @board = board
    @players = players
  end
end
