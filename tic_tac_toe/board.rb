class Board
    @@EMPTY_SPACE = '_'

    def initialize()
        @grid = Array.new(3) {Array.new(3, @@EMPTY_SPACE)}
    end

    #position => [row, column]
    def valid?(position)
        row, col = position
        (row >= 0 && row < @grid.length) && (col >= 0 && col < @grid[0].length)
    end

    #position => [row, column]
    def empty?(position)
        row, col = position
        @grid[row][col] == @@EMPTY_SPACE
    end

    def place_mark(position, mark)
        raise "#{position} is not a valid position" if !valid?(position)
        raise "#{position} already occupied" if !empty?(position)
        
        row, col = position
        @grid[row][col] = mark
    end

    def win_row?(mark)
        win_row_of_grid?(@grid, mark)
    end

    def win_row_of_grid?(grid, mark)
        grid.each do |row|
            return true if row.all? {|c| c == mark}
        end
        false
    end

    def win_col?(mark)
        win_row_of_grid?(@grid.transpose, mark)
    end

    def win_diagonal?(mark)
        win = true
        # center must be filled -- easy short-circuit
        return false if @grid[1][1] != mark
        
        #start from NW corner
        @grid.each_with_index do |row, i|
            if row[i] != mark
                win = false
                break
            end
        end

        return true if win

        win = true
        #start from NE corner
        col_idx =  @grid.size - 1
        @grid.each do |row|
            if row[col_idx] != mark
                win = false
                break
            end
            col_idx -= 1
        end

        win
    end

    def win?(mark)
        win_row?(mark) || win_col?(mark) || win_diagonal?(mark)
    end

    def empty_positions?
        @grid.any? { |row| row.any? {|c| c == @@EMPTY_SPACE}}
    end

    def print
        @grid.each do |row|
            puts
            row.each do |col_val|
                STDOUT.print "#{col_val}     "
                STDOUT.flush
            end
            puts
        end
        puts
        puts
    end

end