require_relative 'card.rb'
require "colorize"


class Board
    attr_reader :size;

    #todo: enforce size must be even number
    def initialize(size)
        @size = size
        @grid = Array.new(size) {Array.new(size)}
        populate
    end

    def populate
        # get range of cards we can use (knowing we must have pairs)
        #cards = playing_cards.sample(@size**2 / 2)
        cards = (@size**2 / 2).times.map {playing_cards.sample}
        cards.concat(cards).shuffle! #pair them up and shuffle
        @grid.each {|row| row.map! {|e| Card.new(cards.pop)} }
        true
    end

    def render(show_all=false)
        cell_size = 2
        idx_color = :yellow

        # print header
        # TODO: don't pad the first 0
        (0..@size).each {|i| print "#{i.to_s.rjust(cell_size).colorize(idx_color)} "}
        puts

        (1..@size).each do |i|
            # TODO: don't pad the row headings
            print "#{i.to_s.rjust(cell_size).colorize(idx_color)} "
            (1..@size).each do |j|
                card = self[[i,j]]    
                val = card.to_s
                val = card.face_value if show_all
                print "#{val.to_s.rjust(cell_size)} "
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

    # private
    def playing_cards
        (2..10).to_a.concat(['J','Q','K','A'])
    end


    

end