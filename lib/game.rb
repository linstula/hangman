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

  # def check_word_guess(word)
  #   if word == @word.generated_word
  #     true
  #   else
  #     false
  #   end
  # end
end
