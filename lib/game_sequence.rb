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
    until_these_match(mark, /^[x,|X|o|O]$/) { "Choose your mark: 'X' or 'O'" }
    mark
  end

  private

  def until_these_match(data, condition, &block)
    until data.match(condition)
      output.puts yield
      data = get_input
    end
  end

  def get_input
    input.gets.chomp.capitalize
  end
end
