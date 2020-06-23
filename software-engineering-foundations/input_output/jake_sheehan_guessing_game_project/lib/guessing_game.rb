# Guessing Game
# Jake Sheehan
# App Academy Open

class GuessingGame
    def initialize(min, max)
        @min = min
        @max = max
        @secret_num = rand(min..max)
        @num_attempts = 0
        @game_over = false
    end

    ### Get methods ###

    def num_attempts
        @num_attempts
    end

    def game_over?
        @game_over
    end

    ### Instance methods ###

    def check_num(num)
        @num_attempts += 1

        if num == @secret_num
            @game_over = true
            puts "you win"
        elsif num > @secret_num
            puts "too big"
        elsif num < @secret_num
            puts "too small"
        else
            puts "error"
        end
    end

    def ask_user
        puts "enter a number"
        guess = gets.chomp.to_i

        self.check_num(guess)
    end
end
