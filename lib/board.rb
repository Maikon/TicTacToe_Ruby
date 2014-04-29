class Board
  attr_reader :grid

  def initialize
    @grid = (1..9).to_a
  end
end
