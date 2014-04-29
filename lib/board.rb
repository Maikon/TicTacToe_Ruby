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

  private

  def left
    rows.map.each_with_index { |row, index| row[index] }
  end

  def right
    rows.reverse.map.each_with_index { |row, index| row[index] }.sort
  end
end
