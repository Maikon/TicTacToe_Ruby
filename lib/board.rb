class Board
  attr_reader :grid

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
    grid.include?(position) ? grid[position - 1] = value : false
  end

  def available_moves
    grid.grep(Fixnum)
  end

  def winner?
    winning_combinations.any? { |combo| combo.all? { |cell| cell == combo.first } }
  end

  def draw?
    available_moves.empty?
  end

  private

  def left
    rows.map.each_with_index { |row, index| row[index] }
  end

  def right
    rows.reverse.map.each_with_index { |row, index| row[index] }
  end
end
