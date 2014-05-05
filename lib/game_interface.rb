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

  def choose_name
    output.puts 'What shall I call you today?'
    name = get_input
    name
  end

  def choose_mark
    output.puts "Choose your mark: 'X' or 'O'"
    check_for_conditions(get_input, /^[x|X|o|O]$/, &ask_for_mark)
  end

  def choose_turn
    output.puts 'Who would you like to go first: 1) You or 2) Computer'
    check_for_conditions(get_input, /^[1|2]$/, &ask_for_number)
  end

  def choose_move
    output.puts "Ok #{player.name}, choose a move from the board:"
    move = get_input.to_i
    available_moves_include(move)
  end

  def set_human_attributes
    player.set_name(choose_name)
    player.set_mark(choose_mark)
  end

  private

  def check_for_conditions(some_input, condition)
    data = some_input
    until data.match(condition)
      yield
      data = get_input
    end
    data
  end

  def ask_for_mark
    -> { output.puts 'Please choose X or O:' }
  end

  def ask_for_number
    -> { output.puts 'Please choose 1 or 2:' }
  end

  def get_input
    input.gets.chomp.to_s.capitalize
  end

  def available_moves_include(move)
    until board.available_moves.include?(move)
      output.puts 'Please choose a valid move:'
      move = get_input.to_i
    end
    move
  end
end
