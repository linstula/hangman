require_relative '../spec_helper'

describe Game do

  let(:valid_game)  { Game.new }

  # Player count

  it "does not accept less than 1 or more than 5 players" do
    number = 0
    expect(valid_game.valid_player_count?(number)).to be false
    number = 6
    expect(valid_game.valid_player_count?(number)).to be false
  end

  # Player names

  it "cannot have a player with a blank name" do
    name = ""
    expect(valid_game.player_name_present?(name)).to be false
  end

  it "cannot have players with duplicate names" do
    player_1 = Player.new("Name")
    dup_name = "Name"
    players = [player_1]
    expect(valid_game.unique_player_name?(players, dup_name)).to be false
  end

  it "is case insensitive when validating uniqueness of names" do
    name_1 = "Player"
    name_2 = "player"
    player_1 = Player.new(name_1)
    players = [player_1]
    expect(valid_game.unique_player_name?(players, name_2)).to be false
  end

  # Letter guesses

  it "checks to see if the hidden word contains the guessed letter" do
    guess = "O"
    word = "WORD"
    valid_game.word.generated_word = word
    expect(valid_game.letter_guess_match?(guess)).to eql true

    guess = "Z"
    expect(valid_game.letter_guess_match?(guess)).to eql false
  end

  it "recognizes when a letter has already been guessed" do
    guess_1 = "O"
    guess_2 = "O"
    guesses_array = [guess_1]
    valid_game.guessed_letters = guesses_array
    expect(valid_game.already_guessed?(guess_2)).to be true
  end
end
