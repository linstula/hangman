class Interface

  def prompt_player_count
    puts "How many players? (1-5)"
    gets.chomp.to_i
  end

  def invalid_player_count
    puts "Thats not a valid number"
  end

  def prompt_player_name(player_number)
    puts "What is Player #{player_number}'s name?"
    gets.chomp
  end

  def duplicate_name
    puts "That name has already been taken!"
  end

  def blank_name
    puts "Player name can't be blank!"
  end

  def lets_play
    puts "Okay! Let's play!"
  end

  def display_hidden_word(game)
    puts "#{game.word.hidden_word}"
  end

  def you_won(player)
    puts "#{player.name} won! Congratulations!"
  end

  def prompt_guess(player)
    print "#{player.name}, guess a letter, or enter '!' to solve the puzzle: "
    gets.chomp.upcase
  end

  def prompt_word_guess
    puts "What is your guess?"
    gets.chomp.upcase
  end

  def correct_word_guess
    puts "You guessed right!"
  end

  def incorrect_word_guess
    puts "Nope, sorry!"
  end

  def correct_letter_guess(letter)
    puts "We found #{letter}!"
  end

  def incorrect_letter_guess(letter)
    puts "Sorry, we didn't find #{letter}!"
  end

  def duplicate_guess(letter)
    puts "#{letter} has already been played, silly!"
  end
end
