class GameInterface
  attr_reader :board, :player, :output, :input

  def initialize(board, player)
    @board = board
    @player = player
    @output = $stdout
    @input = $stdin
  end

  def greet_player
    output.puts '-----------------------'
    output.puts 'Welcome to Tic Tac Toe!'
    output.puts '-----------------------'
  end

  end
end
