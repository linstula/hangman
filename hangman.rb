require_relative "lib/game"
require_relative "lib/word"
require_relative "lib/player"
require_relative "lib/interface"
require_relative "lib/controller"


hangman = Controller.new

hangman.setup_game

while true
	hangman.game.players.each do |player|
		hangman.take_turn(player)
	end
end
