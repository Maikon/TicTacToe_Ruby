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
end
