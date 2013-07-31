class Game

  attr_reader :word
  attr_accessor :players, :guessed_letters

  def initialize
    @players = []
    @guessed_letters = []
    @word = Word.new
  end

  def valid_player_count?(count)
    if count >= 1 && count <= 5
      return true
    else
      false
    end
  end

  def player_name_present?(name)
    if name != ""
      true
    else
      false
    end
  end

  def unique_player_name?(players_collection, name)
    uniqueness = true
    players_collection.each do |existing_player|
      if name.downcase == existing_player.name.downcase
        uniqueness = false
      end
    end
    uniqueness
  end

  def shuffle_order
    @players.shuffle!
  end

  def letter_guess_match?(letter)
    @guessed_letters << letter
    if @word.generated_word.include?(letter)
      true
    else
      false
    end
  end

  def all_letters_guessed?
    @word.all_letters_guessed?
  end

  def already_guessed?(letter)
    if @guessed_letters.include?(letter)
      true
    else
      false
    end
  end

  def word_guess_correct?(word_guess)
    @word.check_word_guess(word_guess)
  end
end
