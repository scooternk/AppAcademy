require './board.rb'
require './human_player.rb'

class Game
    attr_reader :board, :players

    def initialize(size, *marks)
        raise "Players must have unique marks" if marks != marks.uniq
        raise "A minimum of two players is required" if marks.size < 2
        
        @board = Board.new(size)

        @players = []
        marks.each do |m|
            @players << HumanPlayer.new(m)
        end
        @current_player = @players[0]
    end

    def switch_turn
        @current_player = @players.rotate![0]
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
                switch_turn
            end
        end
        @board.print
        puts "Game has ended in a draw!!"
    end
end