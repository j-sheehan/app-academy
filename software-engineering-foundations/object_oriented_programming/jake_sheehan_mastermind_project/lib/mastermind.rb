require_relative "code"

class Mastermind
    ### Init method ###
    def initialize(length)
        @secret_code = Code.random(length)
    end

    ### Instance methods ###
    def print_matches(code_instance)
        exact = @secret_code.num_exact_matches(code_instance)
        puts "Exact matches: #{exact}"

        near = @secret_code.num_near_matches(code_instance)
        puts "Near matches: #{near}"
    end

    def ask_user_for_guess
        print "Enter a code: "
        input = gets.chomp
        guess = Code.from_string(input)
        self.print_matches(guess)

        @secret_code == guess
    end

end
