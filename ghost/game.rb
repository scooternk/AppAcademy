require_relative 'player.rb'
require 'set'

class Game
    # class << self
        @@dictionary_file = "short.txt"
        @@elimination_word = "GHOST"

    # end

    attr_accessor :current_player, :previous_player

    def initialize(player1, player2)
        @player1 = player1
        @player2 = player2
        @current_player = @player1
        @previous_player = @player2 # TODO: may not want to do this
        @fragment = ""
        @losses = init_losses(player1, player2)
        @dictionary = load_dictionary
    end

    

    def play_round
        #take turn for every player
        #todo: update losses
    end

    def next_player!
        @current_player, @previous_player = @previous_player, @current_player
    end

    #TODO: rework the until clause...need to be able to account for game over
    # valid play -- just makesure input is valid?
    # then we: change fragment. then check if contained in dictionary (prev player loses),
    # OR
    def take_turn(player)
        char = nil 
        until valid_play?(char)
            begin
                char = player.guess
            rescue
                #TODO: this is only if error
                player.alert_invalid_guesss
                char = nil
            end
        end
        puts "Player adds #{char}"
        @fragment << char
        puts "Fragment is now '#{@fragment}'"
    end

    # Checks that string is a letter of the alphabet
    # and that there are words we can spell after adding it to the fragment
    def valid_play?(str)
        return false unless str =~ /^[a-zA-Z]{1,1}$/

        # new_fragment = @fragment + str
        # if we find it in the set, play is over and prev player loses
        # return true if @dictionary[new_fragment]

        # are there are words we can spell after adding it to the fragment?
        return words_with_fragment_exist(@fragment + str)
    end


    ### PRIVATE HELPER METHODS ###
    # todo MAKE THESE PRIVATE

    def init_losses(*players)
        @losses = Hash.new(0)
        players.each {|p| @losses[p]}
        @losses
    end

    def record(player)
        return @@elimination_word[0, @losses[player]]
    end

    def load_dictionary
        dictionary = Set.new
        File.open(@@dictionary_file) do |f|
            dictionary = dictionary.merge( f.readlines.map(&:chomp))
        end
        dictionary
    end

    def words_with_fragment_exist(fragment)
        @dictionary.each do |word|
            if word =~ /^#{fragment}.+$/
                puts "'#{word}' matches '#{fragment}'"
                return true 
            end
        end
        false
    end


    def print_dictionary
        @dictionary.foreach do |v|
            puts v
        end
    end


end

#testing
p = Player.new("Scott")
p2 = Player.new("Opponent")
g = Game.new(p, p2)

puts "#{p.name}'s record is #{g.record(p)}"