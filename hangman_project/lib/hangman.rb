class Hangman
  DICTIONARY = ["cat", "dog", "bootcamp", "pizza"]
  PERMITTED_NUM_GUESSES = 5

  def initialize
    @secret_word = Hangman.random_word
    @attempted_chars = []
    @remaining_incorrect_guesses = PERMITTED_NUM_GUESSES
    @guess_word = Array.new(@secret_word.length, '_')
  end
  
  # GETTERS
  def self.random_word
    DICTIONARY.sample
  end

  def remaining_incorrect_guesses
    @remaining_incorrect_guesses
  end

  def guess_word
    @guess_word
  end

  def attempted_chars
    @attempted_chars
  end

  # INSTANCE METHODS
  def already_attempted?(char)
    @attempted_chars.include?(char)
  end

  def get_matching_indices(char)
    @secret_word.chars.each_index.select {|i| @secret_word[i] == char }
  end

  def fill_indices(char, indices)
    indices.each {|i| @guess_word[i] = char}
  end

  def try_guess(char)
    if already_attempted?(char)
      print 'That has already been attempted' 
      return false
    else
      @attempted_chars << char
    end

    matches = get_matching_indices(char)
    if matches.length > 0
      fill_indices(char, matches)
    elsif
      @remaining_incorrect_guesses -= 1
    end

    true
  end

  def ask_user_for_guess
    print "Enter a char: "
    char = gets.chomp

    try_guess(char)
  end

  def win?
    if @guess_word.join == @secret_word
      print 'WIN'
      return true
    end
    false
  end

  def lose?
    if @remaining_incorrect_guesses == 0
      print 'LOSE'
      return true
    end
    false
  end

  def game_over?
    if win? || lose?
      puts
      print "Word: #{@secret_word}"
      return true
    end
    false
  end

end
