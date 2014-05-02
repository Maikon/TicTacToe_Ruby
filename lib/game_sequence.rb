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

  private

  def get_input
    input.gets.chomp.capitalize
  end
end
