require './maze.rb'

class BoardSolver

    def initialize(file)
        @maze = Maze.new(file)
    end

    def run

        while !@maze.solved?
            #brute force keep moving in one direction until we cannot
            #then move to next cardinal position

        end

        #solved
        puts "MAZE SOLUTION:"
        @maze.print

    end

end