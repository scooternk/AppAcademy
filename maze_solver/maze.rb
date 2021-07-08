class Maze
    @@PATH = :X
    @@START = :S
    @@END = :E
    @@WALL = :*
    @@EMPTY = ""

    def initialize(file)
        #todo: throw exceptions
        if !File.exist? file
            print "Unknown file: #{file}"
            return
        end

        #todo: enforce rows/columns equal size?

        @maze = []
        File.foreach(file) do |line|
            @maze << line.strip.split(//)
         end
        @orig_maze = @maze

        if set_posts
            @currrent_pos = @start
        else
            #todo throw exception
            print "Unable to locate start and/or end position in maze"
        end

    end

    def print
        print_maze(@maze)
    end

    def print_original
        print_maze(@orig_maze)
    end

    def solved?
        @currrent_pos == @end
    end

    def move_north
        row, col = @currrent_pos

        return false if row == 0 # can't move further north

        if is_empty? @maze[row-1][col]
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

        if is_empty? @maze[row][col+1]
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

        if is_empty? @maze[row+1][col]
            @maze[row+1][col] = @@PATH
            @currrent_pos = [row+1][col]
            return true
        end

        return false
    end

    def move_west
        row, col = @currrent_pos

        return false if col == 0 # can't move further west

        if is_empty? @maze[row][col-1]
            @maze[row][col-1] = @@PATH
            @currrent_pos = [row][col-1]
            return true
        end

        return false
    end

    #should be private
    def print_maze(maze)
        maze.each do |row|
            row.each do |pos|
                print pos
            end
            puts
        end
    end

    def is_wall?(position)
        is_pos_of_type?(@@WALL)
    end

    def is_empty?(position)
        is_pos_of_type?(@@EMPTY)
    end

    def is_traversd?(position)
        is_pos_of_type?(@@PATH)
    end

    def is_pos_of_type?(position, type)
        row, col = position
        @maze[row][col] == pos
    end

    #todo: refactor using indexOf on rows?
    def set_posts
        # puts @@START.to_s
        @maze.each_with_index do |row, i|
            row.each_with_index do |col, j|
                #  puts "@maze[i][j] is #{@maze[i][j]}"
                @start = [i,j] if @maze[i][j] == @@START.to_s
                @end = [i,j] if @maze[i][j] == @@END.to_s

                if @start && @end
                    return true
                end
            end
        end

        return false if !(@start && @end)
        return true
    end

end