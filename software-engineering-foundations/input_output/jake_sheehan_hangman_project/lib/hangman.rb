# Hangman Game
# Jake Sheehan
# App Academy

class Hangman
  DICTIONARY = ["cat", "dog", "bootcamp", "pizza"]
  
  def self.random_word
    DICTIONARY.sample
  end

  def initialize()
    @secret_word = Hangman.random_word
    @guess_word = Array.new(@secret_word.length, "_")
    @attempted_chars = []
    @remaining_incorrect_guesses = 5
  end

  ### Get methods ###
  def guess_word
    @guess_word
  end

  def attempted_chars
    @attempted_chars
  end

  def remaining_incorrect_guesses
    @remaining_incorrect_guesses
  end

  ### Instance methods ###
  def already_attempted?(char)
    return true if @attempted_chars.include?(char)
    false
  end

  def get_matching_indices(char)
    indices = []

    @secret_word.each_char.with_index do |letter, idx|
      indices << idx if letter == char
    end

    indices
  end

  def fill_indices(char, indices)
    indices.each { |idx| @guess_word[idx] = char }
  end

  def try_guess(char)
    if self.already_attempted?(char)
      puts "that has already been attempted"
      return false
    end
    
    @attempted_chars << char

    matching_indices = self.get_matching_indices(char)

    @remaining_incorrect_guesses -= 1 if matching_indices.length == 0

    self.fill_indices(char, matching_indices) if matching_indices.length > 0

    true
  end

  def ask_user_for_guess
    print "Enter a char: "
    guess = gets.chomp
    self.try_guess(guess)
  end

  def win?
    if @guess_word.join("") == @secret_word
      puts "WIN"
      return true
    else
      return false
    end
  end

  def lose?
    if @remaining_incorrect_guesses == 0
      puts "LOSE"
      true
    else
      false
    end
  end

  def game_over?
    if self.win? || self.lose?
      puts @secret_word
      return true
    end

    false
  end


end
