class Ai
  attr_reader :interface

  def choose_interface(interface)
    @interface = interface
  end

  def winning_spot_available?
    move_available?(current_player)
  end

  def board_center_available?
    board.available_moves.include?(5)
  end

  def possible_loss?
    move_available?(opponent)
  end

  def diagonal_trap_being_set?
    check_diagonal_formation(opponent)
  end

  def alternative_diagonal_trap_being_set?
    check_alternative_diagonal_formation(opponent)
  end

  def opportunity_to_set_trap_exists?
    check_diagonal
  end

  def mark_winning_spot
    position = position_to_move_depends_on(current_player).first
    board.set_value_for(position, current_player)
  end

  def block_opponent_winning_spot
    position = position_to_move_depends_on(opponent).first
    board.set_value_for(position, current_player)
  end

  def block_diagonal_trap
    position = board.diagonals.flatten.grep(Fixnum).first
    board.set_value_for(position, current_player)
  end

  def block_alternative_diagonal_trap
    position = board.edges.first
    board.set_value_for(position, current_player)
  end

  def set_diagonal_trap
    board.set_value_for(diagonal_move.first, current_player)
  end

  def mark_center
    board.set_value_for(5, current_player)
  end

  def make_random_move
    position = board.available_moves.sample
    board.set_value_for(position, current_player)
  end

  def make_best_move
    return mark_center if board_center_available?
    return mark_winning_spot if winning_spot_available?
    return block_opponent_winning_spot if possible_loss?
    return block_diagonal_trap if diagonal_trap_being_set?
    return block_alternative_diagonal_trap if alternative_diagonal_trap_being_set?
    return set_diagonal_trap if opportunity_to_set_trap_exists?
    make_random_move
  end

  private

  def board
    interface.board
  end

  def current_player
    interface.player.mark == 'X' ? 'O' : 'X'
  end

  def opponent
    interface.player.mark
  end

  def check_diagonal_formation(player)
    board.diagonals.any? do |d|
      d.count(player) == 2 && !first_and_last_spot(d, player)
    end
  end

  def check_alternative_diagonal_formation(player)
    board.diagonals.any? do |d|
      d.count(player) == 2 && first_and_last_spot(d, player)
    end
  end

  def first_and_last_spot(combo, player)
    combo.first == player && combo.last == player
  end

  def position_to_move_depends_on(player)
    option = board.winning_combinations.select do |combo|
      combo.count(player) == 2 && combo.any? { |cell| cell.is_a? Fixnum }
    end.flatten
    option.grep(Fixnum)
  end

  def move_available?(player)
    position_to_move_depends_on(player).empty? ? false : true
  end

  def diagonal_move
    board.diagonals.select { |d| d.count(opponent) == 1 }
                   .flatten
                   .grep(Fixnum)
  end

  def check_diagonal
    diagonal_move.empty? ? false : true
  end
end
