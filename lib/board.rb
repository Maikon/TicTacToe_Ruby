class Board
  attr_reader :grid, :current_player

  def initialize
    @grid = (1..9).to_a
  end

  def rows
    grid.each_slice(3).to_a
  end

  def columns
    rows.transpose
  end

  def diagonals
    [] << left << right
  end

  def edges
    [grid[1], grid[3], grid[5], grid[7]]
  end

  def winning_combinations
    rows + columns + diagonals
  end

  def set_value_for(position, value)
    if grid.include?(position)
      grid[position - 1] = value
      change_turn
    else
      false
    end
  end

  def reset_value_for(position)
    grid[position -1] = position
    change_turn
  end

  def available_moves
    grid.grep(Fixnum)
  end

  def winner?
    winning_combinations.any? { |combo| combo.all? { |cell| cell == combo.first } }
  end

  def draw?
    available_moves.empty? && !winner?
  end

  def win_for?(mark)
    winning_combinations.any? { |combo| combo.all? { |cell| cell == mark } }
  end

  def set_turn(mark)
    @current_player = mark
  end

  def change_turn
    current_player == 'X' ? @current_player = 'O' : @current_player = 'X'
  end

  def show
    puts "#{grid[0]} | #{grid[1]} | #{grid[2]}"
    puts '--|---|--'
    puts "#{grid[3]} | #{grid[4]} | #{grid[5]}"
    puts '--|---|--'
    puts "#{grid[6]} | #{grid[7]} | #{grid[8]}"
  end

  private

  def left
    rows.map.each_with_index { |row, index| row[index] }
  end

  def right
    rows.reverse.map.each_with_index { |row, index| row[index] }
  end
end
