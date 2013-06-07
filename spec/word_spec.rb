require_relative '../spec_helper'

describe Word do

  let(:valid_word) { Word.new }

  it "parses the word into a hash for each letter" do
    word = "WORD"
    valid_word.generated_word = word
    expect(valid_word.hashify_word).to eql( [{"W" => "_"}, {"O" => "_"}, {"R" => "_"}, {"D" => "_"}] )
  end

  it "creates a hidden version of the word" do
    word = "HELLO"
    valid_word.generated_word = word
    valid_word.hashify_word
    valid_word.initialize_hidden_word
    expect(valid_word.hidden_word).to eql("_____")
  end

  it "fills in all occurances of the guessed letter" do
    guess = "L"
    word = "HELLO"
    valid_word.generated_word = word
    valid_word.initialize_hidden_word
    valid_word.hashify_word
    expect(valid_word.hidden_word).to eql("_____")
    valid_word.update_hidden_word(guess)
    expect(valid_word.hidden_word).to eql("__LL_")
  end

  it "recognizes when all letters of the hidden word have been guessed" do
    word = "HELLO"
    valid_word.generated_word = word
    valid_word.initialize_hidden_word
    valid_word.hashify_word
    expect(valid_word.hidden_word).to eql("_____")

    valid_word.update_hidden_word("E")
    valid_word.update_hidden_word("L")
    valid_word.update_hidden_word("O")
    expect(valid_word.hidden_word).to eql("_ELLO")

    valid_word.update_hidden_word("H")
    expect(valid_word.hidden_word).to eql("HELLO")
    expect(valid_word.all_letters_guessed?).to eql(true)
  end

  it "checks to see if the guessed word matches the hidden word" do
    hidden_word = "HELLO"
    player_guess = "HELLO"
    valid_word.generated_word = hidden_word
    expect(valid_word.check_word_guess(player_guess)).to be true
  end

end