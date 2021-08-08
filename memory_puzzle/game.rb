require_relative 'board.rb'

class Game
    attr_reader :board, :prev_guess

    def initialize
        @prev_guess = nil
        @board_size = 4
        @board = Board.new(4)
    end


    def play
        until over?
            @board.render
            
            pos = get_user_guess
            @board.reveal(pos)
            @board.render

            make_guess(pos)
            system("clear")
        end
        puts "Congratulations, you win!"
        @board.render
    end

    def get_user_guess
        puts "Please enter the position of the card to flip (e.g. '2,3')..."
        pos = gets.chomp
        have_pos = false

        while !have_pos
            while !valid_pos?(pos)
                puts "#{pos} is not a valid card position"
                pos = gets.chomp
            end

            valid_pos = pos.split(',').map!(&:to_i)

            if @board[valid_pos].face_up
                puts "Whoops, already matched! Try another position"
                pos = gets.chomp
            else
                have_pos = true
            end
        end

        valid_pos
    end

    def make_guess(pos)
        sleep_duration = 2

        if @prev_guess != nil
            if (@board[pos] != @board[@prev_guess])
                @board[pos].hide
                @board[@prev_guess].hide
            else
                puts "MATCH!"
            end
            @prev_guess = nil
        else
            @prev_guess = pos
        end
        sleep(sleep_duration)
    end



    def valid_pos?(pos)
        r,c = pos.split(',')
        valid_range = (1..@board_size)

        valid_range.include?(r.to_i) && valid_range.include?(c.to_i)
    end

    def over?
        @board.won?
    end

end