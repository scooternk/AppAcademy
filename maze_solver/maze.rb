# Currently the MAZE maintains knowledge of path traveled and current position
# May refactor so that it only maintains the map and utility functions
# that allow consumer to query the map (consumer responsible for recording
# paths, etc)

class Maze
    # @@PATH = :X
    # @@START = :S
    # @@END = :E
    # @@WALL = :*
    # @@CLEAR = :C
    # @@UNKNOWN = :U

    # @DIRECTIONS = [:N, :E, :S, :W].freeze

    # class << self
    #     attr_reader :DIRECTIONS
    # end

    attr_reader :start, :end

    def initialize(file)
        #todo: throw exceptions
        if !File.exist? file
            print "Unknown file: #{file}"
            return
        end

        #todo: enforce rows/columns equal size?

        @maze = read_map(file)
        @orig_maze = @maze

        if !set_posts
            #todo throw exception
            print "Unable to locate start and/or end position in maze"
        end

    end

    def display
        print_maze(@maze)
    end

    def completed?
        @current_pos == @end || !@moves_left
    end

    # def move(direction)
    #     case direction
    #     when :N
    #         move_north
    #     when :E
    #         move_east
    #     when :S
    #         move_south
    #     when :W
    #         move_west
    #     else
    #         raise "Not a valid direction"
    #     end
    # end

    # def is_wall?(position)
    #     is_pos_of_type?(position, @@WALL)
    # end

    # def is_empty?(position)
    #     is_pos_of_type?(position, @@EMPTY)
    # end

    # returns position if valid, or nil if not
    def get_position(current_pos, direction)
        new_direction = []
        case direction
        when :N
            new_direction = [-1,0]
        when :E
            new_direction = [0,1]
        when :S
            new_direction = [1,0]
        when :W
            new_direction = [0,-1]
        end
        new_pos = current_pos.map.with_index {|e, i| e+new_direction[i]}

        return nil if !valid_position?(new_pos)
        new_pos
    end


    private

    def print_maze(maze)
        maze.each do |row|
            row.each do |node|
                print node
            end
            puts
        end
    end

    # note this assumes all rows same len, all cols same len
    def valid_position?(pos)
        r,c = pos
        row_len = @maze[0].length
        col_len = @maze[0].length

        # is within bounds of the maze
        r >= 0 && c >= 0 && r < row_len && c < col_len
    end

    def move_north
        row, col = @currrent_pos

        return false if row == 0 # can't move further north

        if is_empty? [row-1,col]
            @maze[row-1][col] = @@PATH
            @currrent_pos = [row-1][col]
            return true
        end

        return false
    end

    def move_east
        row, col = @currrent_pos
        row_len = @maze[row].length

        return false if col + 1 >=  row_len # can't move further east

        if is_empty? [row,col+1]
            @maze[row][col+1] = @@PATH
            @currrent_pos = [row][col+1]
            return true
        end

        return false
    end

    def move_south
        row, col = @currrent_pos
        col_len = @maze[col].length

        return false if row + 1 >=  col_len # can't move further south

        if is_empty? [row+1,col]
            @maze[row+1][col] = @@PATH
            @currrent_pos = [row+1][col]
            return true
        end

        return false
    end

    def move_west
        row, col = @currrent_pos    

        return false if col == 0 # can't move further west

        if is_empty? [row,col-1]
            @maze[row][col-1] = @@PATH
            @currrent_pos = [row][col-1]
            return true
        end

        return false
    end


    #todo: refactor using indexOf on rows?
    def set_posts
        # puts @@START.to_s
        @maze.each_with_index do |row, i|
            row.each_with_index do |col, j|
                #  puts "@maze[i][j] is #{@maze[i][j]}"
                @start = [i,j] if @maze[i][j] == @@START
                @end = [i,j] if @maze[i][j] == @@END

                if @start && @end
                    return true
                end
            end
        end

        return false if !(@start && @end)
        return true
    end

    def read_map(file)
        maze = []
        File.foreach(file) do |line|
            maze << line.strip.split(//).map {|e| Node.new(e) }
        end
        maze
    end

end