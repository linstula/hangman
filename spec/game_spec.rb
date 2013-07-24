require_relative '../spec_helper'

describe Game do

  # let(:players)     { ["Player1", "Player2", "Player3", "Player4", "Player5"] }
  let(:valid_game)  { Game.new }

  # it "randomizes the play order" do
  #   initial_order = players.dup
  #   expect(valid_game.shuffle_order.first).to_not eql(initial_order.first)
  # end

  it "only accepts an integer as an arguement for player count" do
    invalid_input = "not an integer"
    expect(valid_game.valid_player_count?(invalid_input)).to be false
    valid_input = 3
    expect(valid_game.valid_player_count?(valid_input)).to be true
  end

  it "does not accept less than 1 or more than 5 players" do
    number = 0
    expect(valid_game.valid_player_count?(number)).to be false
    number = 6
    expect(valid_game.valid_player_count?(number)).to be false
  end

  it "checks to see if the hidden word contains the guessed letter" do
    guess = "O"
    word = "WORD"
    valid_game.word.generated_word = word
    expect(valid_game.check_guess(guess)).to eql true

    guess = "Z"
    expect(valid_game.check_guess(guess)).to eql false
  end

  it "recognizes when a letter has already been guessed" do
    guess_1 = "O"
    guess_2 = "O"
    guesses_array = [guess_1]
    valid_game.guessed_letters = guesses_array
    expect(valid_game.already_guessed?(guess_2)).to be true
  end

end
