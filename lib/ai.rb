class Ai
  attr_reader :interface

  def choose_interface(interface)
    @interface = interface
  end

  def winning_spot_available?
    check_for(player_1)
  end

  def board_center_available?
    board.available_moves.include?(5)
  end

  def possible_loss?
    check_for(player_2)
  end

  private

  def board
    interface.board
  end

  def player_1
    interface.players[0].mark
  end

  def player_2
    interface.players[1].mark
  end

  def check_for(player)
    board.winning_combinations.any? do |combo|
      combo.count(player) == 2 && combo.any? { |cell| cell.is_a? Fixnum }
    end
  end
end
