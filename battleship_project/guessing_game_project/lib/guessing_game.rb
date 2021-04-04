class GuessingGame
    def initialize(min, max)
        @secret_num = rand(min..max)
        @num_attempts = 0
        @game_over = false
    end

    def num_attempts
        @num_attempts
    end

    def game_over?
        @game_over
    end

    def check_num(num)
        @num_attempts += 1

        if num == @secret_num
            @game_over = true
            print "You win"
        elsif num < @secret_num
            
            print "Too small"
        else
            print "Too big"
        end
    end

    def ask_user
        print "Enter a number: 
        "
        num = gets.chomp.to_i
        check_num(num)
    end

end
