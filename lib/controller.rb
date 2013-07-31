class Controller

	attr_reader :game, :interface

	def initialize
		@game = Game.new
		@interface = Interface.new
	end

	def setup_game
		count = @interface.prompt_player_count
		if @game.valid_player_count?(count)
			get_all_names(count)
			@interface.lets_play
			@game.shuffle_order
		else
			@interface.invalid_player_count
			setup_game
		end
	end

	def take_turn(player)
		@interface.display_hidden_word(@game)
		guess = @interface.prompt_guess(player)
		if guess == "!"
			check_word_guess(player)
		else
			check_letter_guess(guess, player)
		end
	end

	private

	def get_all_names(count)
		(1..count).each do |i|
			name = get_player_name(i)
			player = Player.new(name)
	    @game.players << player
	  end
	end

	def get_player_name(player_number)
	  name = @interface.prompt_player_name(player_number)
	  if @game.player_name_present?(name)
	    if @game.unique_player_name?(@game.players, name)
	      return name
	    else
	      @interface.duplicate_name
	      get_player_name(player_number)
	    end
	  else
	    @interface.blank_name
	    get_player_name(player_number)
	  end
	end

	def check_word_guess(player)
		word_guess = @interface.prompt_word_guess
		if @game.word_guess_correct?(word_guess)
			@interface.correct_word_guess
			@interface.you_won(player)
			exit
		else
			@interface.incorrect_word_guess
		end
	end

	def check_letter_guess(guess, player)
		if @game.already_guessed?(guess)
			@interface.duplicate_guess(guess)
			take_turn(player)
		else
			if @game.letter_guess_match?(guess)
				@interface.correct_letter_guess(guess)
				@game.word.update_hidden_word(guess)
				if @game.all_letters_guessed?
					@interface.you_won(player)
					exit
				end
			else
				@interface.incorrect_letter_guess(guess)
			end
		end
	end
end
