class GameSequence
  attr_reader :interface, :ai

  def initialize(interface, ai)
    @interface = interface
    @ai = ai
  end

end
