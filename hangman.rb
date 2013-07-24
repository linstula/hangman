require_relative "lib/game"
require_relative "lib/word"
require_relative "lib/interface"


hangman = Interface.new

hangman.get_player_count
hangman.get_all_names

while true
  hangman.game.players.each do |player|
    hangman.take_turn(player)
  end
end
