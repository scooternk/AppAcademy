require_relative 'card.rb'
require_relative 'tile_sets.rb'
require "colorize"

class Board
    attr_reader :size;

    #todo: enforce size must be even number?
    def initialize(size, tile_set)
        @size = size
        @grid = Array.new(size) {Array.new(size)}
        
        @tile_set = tile_set
        @tiles = @tile_set.tiles
        populate
    end

    def populate
        # get range of tiles we can use (knowing we must have pairs)
        cards = (@size**2 / 2).times.map {@tiles.sample}
        cards.concat(cards).shuffle! #pair them up and shuffle
        @grid.each {|row| row.map! {|e| Card.new(cards.pop, @tile_set.hidden_val)} }
        true
    end

    def render(show_all=false)
        #TODO: fix issue -- once we have rows/columns >10, alignment of grid begins to shift
        idx_color = :yellow

        # print header
        (0..@size).each {|i| print "#{i.to_s.rjust(2).colorize(idx_color)} "}
        puts

        (1..@size).each do |i|
            print "#{i.to_s.rjust(2).colorize(idx_color)}"
            (1..@size).each do |j|
                card = self[[i,j]]    
                val = card.to_s
                val = card.face_value if show_all
                
                if @tile_set.alphanumeric
                    print " #{val.to_s.rjust(2)}"
                else
                    print "#{val.to_s.rjust(2)}"
                end
            end
            puts
        end
        true
    end

    def won?
        (1..@size).each do |i|
            (1..@size).each do |j|
                return false if !self[[i,j]].face_up
            end
        end
        true
    end

    def reveal(guessed_pos)
        card = self[guessed_pos]
        return nil if card.face_up

        card.reveal 
        card.face_value
    end

    def reveal_all
        (1..@size).each do |i|
            (1..@size).each do |j|
                reveal([i,j])
            end
        end
        true
    end

    #Board accessors are indexed starting at 1
    def [](pos)
        r, c = pos
        @grid[r-1][c-1]
    end

    def []=(pos, value)
        r, c = pos
        @grid[r-1][c-1] = value
    end

end