class GameSequence
  attr_reader :gi

  SPACING = '-' * 25

  def initialize(gi)
    @gi = gi
  end

  def start
    if gi.choose_turn == '1'
      board.show
      gi.board.set_turn(human.mark)
      human_makes_a_move
    else
      gi.board.set_turn(computer.mark)
      computer_makes_a_move
    end
    puts SPACING
    puts "#{message}"
    another_round
  end

  private

  def human_makes_a_move
    unless board.winner? || board.draw?
      move = gi.choose_move
      board.set_value_for(move, human.mark)
      puts SPACING
      board.show
      computer_makes_a_move
    end
  end

  def computer_makes_a_move
    unless board.winner? || board.draw?
      gi.computer.make_move(board)
      puts SPACING
      puts 'Computer made its move:'
      board.show
      human_makes_a_move
    end
  end

  def message
    board.winner? ? 'Tough luck, the computer won.' : "It's a draw."
  end

  def another_round
    puts "Would you like to play again? Press 'y' to do so or any other key to quit."
    answer = gets.chomp
    if answer.match(/\b(y)\b/)
      system("clear; ruby #{File.expand_path File.dirname(__FILE__)}/run.rb")
    else
      puts SPACING
      puts 'Have an awesome day/night!'
    end
  end

  private

  def board
    gi.board
  end

  def human
    gi.player
  end

  def computer
    gi.computer
  end
end
