class Interface

  attr_accessor :game

  def initialize
    @validator = Validator.new
    @game = Game.new
    @player_count = 0
  end

  def get_player_count
    puts "How many players? (1-5)"
    input = gets.chomp.to_i
    if @validator.valid_player_count?(input)
      @player_count = input
    else
      puts "Thats not a valid number"
      get_player_count
    end
  end

  def get_player_name(player_number)
    puts "What is Player #{player_number}'s name?"
    name = gets.chomp
    if @validator.name_present?(name)
      if @validator.unique_name?(@game.players, name)
        return name
      else
        puts "That name has already been taken!"
        get_player_name
      end
    else
      puts "Player name can't be blank!"
      get_player_name
    end
  end

  def get_all_names
    i = 1
    @player_count.times do |player|
      name = get_player_name(i)
      @game.players << name
      i += 1
    end
    puts "Okay! Let's play!" 
    @game.shuffle_order
  end

  def display_hidden_word
    puts "#{@game.word.hidden_word}"
  end

  def you_won(player)
    puts "#{player} won! Congratulations!"
    exit
  end

  def prompt_guess(player)
    print "#{player}, guess a letter, or enter '!' to solve the puzzle: "
    gets.chomp.upcase
  end

  def prompt_word_guess
    puts "What is your guess?"
    gets.chomp.upcase
  end

  def word_guess(guess, player)
    if @game.word.check_word_guess(guess)
      you_won(player)
    else
      puts "Nope, sorry!"
    end
  end

  def letter_guess(letter, player)
    if @game.check_guess(letter)
      puts "We found #{letter}!"
      @game.word.update_hidden_word(letter) #maybe 
    else
      puts "Sorry, we didn't find #{letter}!"
    end
    if @game.word.all_letters_guessed?
      you_won(player)
    end
  end

  def already_guessed?(letter)
    if @game.already_guessed?(letter)
      puts "#{letter} has already been played, silly!"
      true
    else
      false
    end
  end

  def take_turn(player)
    display_hidden_word
    input = prompt_guess(player)
    if input == "!"
      word_guess = prompt_word_guess
      you_won(player) if word_guess(word_guess, player)
    else
      if already_guessed?(input)
        take_turn(player)
      else
        letter_guess(input, player)
      end
    end    
  end
end