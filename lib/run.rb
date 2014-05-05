#!/usr/bin/ruby

require_relative 'board'
require_relative 'human'
require_relative 'game_interface'
require_relative 'ai'
require_relative 'game_sequence'

human = Human.new
board = Board.new
ui = GameInterface.new(board, human)
ui.greet_player
ui.set_human_attributes
ai = Ai.new
ai.choose_interface(ui)
sequence = GameSequence.new(ai)
sequence.start
