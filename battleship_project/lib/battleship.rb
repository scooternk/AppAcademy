require_relative "board"
require_relative "player"

class Battleship

    attr_reader :board, :player

    def initialize(length)
        @player = Player.new()
        @board = Board.new(length)
        @remaining_misses = @board.size / 2
    end


    def start_game()
        board.place_random_ships
        puts "There are #{board.num_ships} ships on the board"
        board.print
    end

    def lose?()
        if @remaining_misses <= 0
            print "you lose"
            return true
        end
        false
    end

    def win?()
        if board.num_ships == 0
            print "you win"
            return true
        end
        false
    end

    def game_over?()
        win? || lose?
    end

    def turn()
        if !board.attack(player.get_move) #no dice, player!
            @remaining_misses -= 1
        end

        puts "Remaining attempts: #{@remaining_misses}"
        board.print
    end



end
