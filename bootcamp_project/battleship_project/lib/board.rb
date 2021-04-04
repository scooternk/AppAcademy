class Board
    SHIP = :S
    HIIDDEN_SHIP = :N
    HIT = :H
    MISS = :X

    attr_reader :size

    def initialize(length)
        @board_length = length
        @size = length * length
        @grid = Array.new(length) {Array.new(length, HIIDDEN_SHIP)}
    end

    def self.print_grid(grid)
        grid.each do |row|
            row.each_index do |i|
                print "#{row[i]}"
                print " " if i < row.length-1
            end
            print "\n"
        end
    end

    def num_ships
        @grid.sum {|row| row.count {|e| e == SHIP }}
    end

    #position => [row, column]
    def [](position)
        row, col = position
        @grid[row][col]
    end

    def []=(position, val)
        row, col = position
        @grid[row][col] = val
    end

    def attack(position)
        if (self[position] == SHIP)
            self[position] = HIT
            puts "you sunk my battleship!"
            return true
        else
            self[position] = MISS
            return false
        end
    end

    ### Place ships on 20% of the board
    def place_random_ships()
        # check number on board bc random may place in same spot
        while num_ships() < (@size / 4) do
            @grid[rand(@board_length-1)][rand(@board_length-1)] = SHIP
        end
    end

    def hidden_ships_grid()
        @grid.map {|row| row.map {|e| e == SHIP ? HIIDDEN_SHIP : e}}
    end

    def print()
        Board.print_grid(hidden_ships_grid)
    end

    #prints board showing all ships
    def cheat()
        Board.print_grid(@grid)
    end
end
