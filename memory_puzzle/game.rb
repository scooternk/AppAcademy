require_relative 'board.rb'

class Game
    attr_reader :board, :prev_guess

    def initialize(size, player)
        @prev_guess = nil
        @board_size = size
        @board = Board.new(size)
        @player = player
    end

    def play
        until over?
            system("clear")
            
            print_board
            
            pos = get_guess(@player)
            puts "Guess #{pos}"
            val = @board.reveal(pos)
            @player.receive_revealed_card(pos, val)
            
            print_board
            
            make_guess(pos)
        end
        puts
        puts "Congratulations, you win!"
        @board.render
    end

    def print_board
        @board.render
        puts
    end

    def get_guess(player)
        pos = player.get_input
        sleep(3)
        card = @board[pos]

        while card.face_up
            # AI should never end up here -- shouldn't pick face_up cards!
            puts "Whoops, position #{pos} (#{card.face_value}) is already showing! Try another position"
            pos = player.get_input
            card = @board[pos]
        end
        pos
    end

    def make_guess(pos)
        sleep_duration = 3

        if @prev_guess != nil
            if (@board[pos] != @board[@prev_guess])
                @board[pos].hide
                @board[@prev_guess].hide
            else
                puts "MATCH #{@board[pos].face_value}! #{pos} and #{@prev_guess}"
                @player.receive_match(pos, @prev_guess)
            end
            @prev_guess = nil
        else
            @prev_guess = pos
        end
        sleep(sleep_duration)
    end

    def over?
        @board.won?
    end

end