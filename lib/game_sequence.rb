class GameSequence
  attr_reader :interface, :ai, :output, :input

  def initialize(interface, ai, output = nil, input = nil)
    @interface = interface
    @ai = ai
    @output = $stdout
    @input = $stdin
  end

  def greet_player
    output.puts 'Welcome to Tic Tac Toe.'
  end

  def get_name
    output.puts 'What shall I call you today?'
    name = get_input
    name
  end

  def get_mark
    output.puts "Choose your mark: 'X' or 'O'"
    mark = get_input
    until_these_match(mark, /^[x,|X|o|O]$/, &ask_for_mark)
  end

  def choose_turn
    output.puts 'Who would you like to go first: 1) You or 2) Computer'
    choice = get_input
    until_these_match(choice, /^[1|2]$/, &ask_for_number)
  end

  private

  def until_these_match(data, condition)
    until data.match(condition)
      yield
      data = get_input
    end
    data
  end

  def get_input
    input.gets.chomp.capitalize
  end

  def ask_for_mark
    Proc.new { output.puts 'Please choose X or O:' }
  end

  def ask_for_number
    Proc.new { output.puts 'Please choose 1 or 2:' }
  end
end
