require 'computer'
require 'board'
require 'spec_helper'

describe Computer do
  let(:cpu)    { Computer.new }
  let(:player) { double :human, mark: 'X' }
  let(:board)  { Board.new }

  context '#choose_mark_depending_on_opponent' do
    it 'sets the computer mark depending on opponent' do
      expect(cpu.mark).to eq nil
      cpu.choose_mark_depending_on_opponent(player)
      expect(cpu.mark).to eq 'O'
    end
  end

end
