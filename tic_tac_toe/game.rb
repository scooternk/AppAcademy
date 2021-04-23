require './board.rb'
require './human_player.rb'

class Game
    attr_reader :board

    def initialize(p1mark, p2mark)
        @board = Board.new()
        @player1 = HumanPlayer.new(p1mark)
        @player2 = HumanPlayer.new(p2mark)
        @current_player = @player1
    end

    def switch_player
        @current_player = (@current_player == @player1) ? @player2 : @player1
    end

    def play
        while @board.empty_positions?
            @board.print

            begin
                move = @current_player.get_position
                @board.place_mark(move, @current_player.mark)
            rescue StandardError => e
                puts "#{e.message}"
                retry
            end

            if @board.win?(@current_player.mark)
                @board.print
                puts "Player #{@current_player.mark} WINS!!"
                return
            else
                switch_player
            end
        end
        @board.print
        puts "Game has ended in a draw!!"
    end
end