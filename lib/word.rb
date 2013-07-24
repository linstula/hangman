require "random_word_generator"

class Word
  attr_accessor :generated_word, :hidden_word, :hashed_word

  def initialize
    @generated_word = RandomWordGenerator.word.upcase
    @hashed_word = hashify_word
    @hidden_word = initialize_hidden_word
  end

  def hashify_word
    hashed_word = []
    i = 0
    @generated_word.length.times do
      hashed_word << {@generated_word[i] => "_"}
      i += 1
    end
    hashed_word
  end

  def initialize_hidden_word
    hidden_word = ""
    @generated_word.length.times { hidden_word << "_" }
    hidden_word
  end

  def update_hidden_word(letter)
    updated_word = ""
    @hashed_word.each do | letter_hash |
      if letter_hash.keys.first == letter
        letter_hash[letter] = letter
      end
        updated_word << letter_hash.values.first
    end
    @hidden_word = updated_word
  end

  def all_letters_guessed?
    if hidden_word.include?("_")
      false
    else
      true
    end
  end

  def check_word_guess(guess)
    if guess == @generated_word
      true
    else
      false
    end
  end

end
