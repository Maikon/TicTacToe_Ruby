#!/usr/bin/ruby

require_relative 'board'
require_relative 'human'
require_relative 'computer'
require_relative 'game_interface'
require_relative 'game_sequence'

human = Human.new
board = Board.new
cpu = Computer.new
ui = GameInterface.new(board, human, cpu)
ui.greet_player
ui.set_human_attributes
cpu.choose_mark_depending_on_opponent(human)
sequence = GameSequence.new(ui)
sequence.start
