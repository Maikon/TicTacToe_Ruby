class GameSequence
  attr_reader :ai

  SPACING = '-' * 25

  def initialize(ai)
    @ai = ai
  end

  def start
    if ai.interface.choose_turn == '1'
      board.show
      human_makes_a_move
    else
      computer_makes_a_move
    end
    puts SPACING
    puts "#{message}"
    another_round
  end

  private

  def human_makes_a_move
    unless board.winner? || board.draw?
      move = ai.interface.choose_move
      board.set_value_for(move, human.mark)
      puts SPACING
      board.show
      computer_makes_a_move
    end
  end

  def computer_makes_a_move
    unless board.winner? || board.draw?
      ai.make_best_move
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

  def board
    ai.interface.board
  end

  def human
    ai.interface.player
  end
end
