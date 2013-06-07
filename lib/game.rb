class Game

  attr_accessor :word, :guessed_letters, :players

  def initialize
    @players = []
    @guessed_letters = []
    @word = Word.new

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