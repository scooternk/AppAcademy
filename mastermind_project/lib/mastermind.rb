require_relative "code"

class Mastermind


    def initialize(size)
        @secret_code = Code.random(size)
    end

    def print_matches(code)
        puts "#{@secret_code.num_exact_matches(code)} exact matches"
        puts "#{@secret_code.num_near_matches(code)} near matches"
    end

    def ask_user_for_guess()
        print "Enter a code: "
        guess = gets.chomp

        if !Code.valid_pegs?(guess.chars)
            puts "Invalid pegs"
            return false
        end

        code_guess = Code.from_string(guess)

        print_matches(code_guess)

        # figured out the code?
        @secret_code == code_guess
    end

end
