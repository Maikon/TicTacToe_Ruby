class Computer
  attr_accessor :mark

  def choose_mark_depending_on_opponent(player)
    player.mark == 'X' ? self.mark = 'O' : self.mark = 'X'
  end

  private

  def opponent
    mark == 'X' ? 'O' : 'X'
  end
end
