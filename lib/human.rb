class Human
  attr_reader :name, :mark, :move

  def set_name(name)
    @name = name
  end

  def set_mark(mark)
    @mark = mark
  end

  def choose_move(move)
    @move = move
  end
end
