require './board.rb'
require './human_player.rb'
require './computer_player.rb'

class Game
    attr_reader :board, :players

    def initialize(size, players)
        raise "A minimum of two players is required" if players.size < 2
        
        @board = Board.new(size)

        @players = []
        players.each do |mark, isComp|
            @players <<  (isComp ? ComputerPlayer.new(mark) : HumanPlayer.new(mark))
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
                move = @current_player.get_position(@board.legal_positions)
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