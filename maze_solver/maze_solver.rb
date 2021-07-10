require './maze.rb'
require './node.rb'
require "colorize"

class MazeSolver

    def initialize(file)
        @maze = Maze.new(file)
        @path = []
        @completed = false
        @current_position - @maze.start
    end

    def find_adjacent_wall(position)
        #want to do something like:
        #if @maze.node_at(position, :N).is_wall?
        
        # if @maze.get_position(position, :N).is_wall?
        #     puts "Wall found to North"
        # else
        #     puts "no wall to north!"
        # end
    end

    def run
        #find_adjacent_wall(@maze.start)
        
        #while !@completed
            #find closest wall
            #look for open path in d+1, then d-1
            #continue in that direction until we encounter wall
            #repeat until we find exit or no open paths left

         #end

        #solved
        puts "MAZE:"
        @maze.display
    end

end