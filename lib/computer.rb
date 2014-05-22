class Computer
  attr_accessor :mark

  def choose_mark_depending_on_opponent(player)
    player.mark == 'X' ? self.mark = 'O' : self.mark = 'X'
  end

  def make_move(board)
    move_position = minimax(board)
    board.set_value_for(move_position, mark)
  end

  def minimax(board, depth = 0, score = {})
    return 10 if board.win_for?(mark)
    return 0 if board.draw?
    return -10 if board.win_for?(opponent)
    board.available_moves.each do |m|
      board.set_value_for(m, board.current_player)
      score[m] = minimax(board, depth += 1, {})
      board.reset_value_for(m)
    end
    if depth == board.available_moves.length
      move = score.max_by { |move, result| result}[0]
      return move
    end
    if board.current_player == mark
      move = score.max_by { |move, result| result }[1]
    else
      move = score.min_by { |move, result| result }[1]
    end
  end

  private

  def opponent
    mark == 'X' ? 'O' : 'X'
  end
end
