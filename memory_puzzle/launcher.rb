require_relative 'game.rb'
require_relative 'human_player.rb'
require_relative 'computer_player.rb'
require_relative 'tile_sets.rb'
require_relative 'utils.rb'
require "colorize"

class Launcher
    HUMAN_MODE = 1
    COMPUTER_MODE = 2
    DEFAULT_BOARD_SIZE = 2

    def initialize
        @modes = {HUMAN_MODE => "Human Player", COMPUTER_MODE=> "Computer Player"}
    end

    def valid_game_mode(str)
        digit?(str) && @modes.keys.include?(str.to_i)
    end

    def valid_board_size(str)
        digit?(str) && str.to_i > 0 && str.to_i % 2 == 0
    end

    def prompt_play_mode
        option = nil
        until valid_game_mode(option)        
            puts "Enter game mode:"
            @modes.each do |mode, desc|
                puts "#{mode}: #{desc}"
            end
            option = gets.chomp
        end
        option.to_i
    end

    def prompt_board_size
        size = nil
        until valid_board_size(size)
            puts "What size board? Enter a multiple of 2:"
            size = gets.chomp
        end
        size.to_i
    end

    def play_again?
        puts "Play again? (Y/N)"
        yes?
    end

    def play_default?
        puts "Play defaults (Computer player, #{DEFAULT_BOARD_SIZE}x#{DEFAULT_BOARD_SIZE} board)? (Y/N)"
        yes?
    end

    def yes?
        ["y","Y", ""].include?(gets.chomp)
    end

    def display_welcome
        puts "Welcome to Memory Puzzle!"
        puts "This is a game for a single player."
    end

    # expects param in valid range already
    def get_player(mode=2, board_size=4)
        player = nil

        case mode
        when HUMAN_MODE
            player = HumanPlayer.new(board_size)
        when COMPUTER_MODE
            player = ComputerPlayer.new(board_size)
        else
            raise "Unexpected game mode retrieving player: #{mode}."
        end

        player
    end

    def run(show_welcome=true)
        play = true

        while(play)
            display_welcome if show_welcome

            mode = COMPUTER_MODE
            size = DEFAULT_BOARD_SIZE
            
            if !play_default?
                mode = prompt_play_mode
                size = prompt_board_size
            end

            player = get_player(mode, size)
            game = Game.new(size, player)
            game.play

            play = play_again?
            show_welcome = !play
        end
    end

end

game_launcher = Launcher.new
game_launcher.run