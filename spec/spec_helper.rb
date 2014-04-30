def full_board_draw
  board.set_value_for(1, 'X')
  board.set_value_for(2, 'X')
  board.set_value_for(3, 'O')
  board.set_value_for(4, 'O')
  board.set_value_for(5, 'O')
  board.set_value_for(6, 'X')
  board.set_value_for(7, 'X')
  board.set_value_for(8, 'O')
  board.set_value_for(9, 'X')
end

def fill_top_row_with_x
  board.set_value_for(1, 'X')
  board.set_value_for(2, 'X')
  board.set_value_for(3, 'X')
end

def fill_cell(position, mark)
  board.set_value_for(position, mark)
end
