class Game

  attr_accessor :word, :guessed_letters, :players, :player_count

  def initialize
    @players = []
    @guessed_letters = []
    @word = Word.new
    @player_count = 0
  end

  def valid_player_count?(number)
    if number.class == Fixnum && number >= 1 && number <= 5
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

  def unique_player_name?(player_collection, name)
    uniqueness = true
    player_collection.each do |existing_player|
      if name.downcase == existing_player.downcase
        uniqueness = false
      end
    end
    uniqueness
  end

  def shuffle_order
    @players.shuffle!
  end

  def check_guess(letter)
    if @word.generated_word.include?(letter)
      true
    else
      false
    end
  end

  def already_guessed?(letter)
    if @guessed_letters.include?(letter)
      true
    else
      false
    end
  end
end
