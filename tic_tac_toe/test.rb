require './board.rb'

def check_mark_state(b, mark)
    print "winning row for #{mark}? "
    print b.win_row?(mark).to_s.upcase
    puts

    print "winning col for #{mark}? "
    print b.win_col?(mark).to_s.upcase
    puts

    print "winning diagonal for #{mark}? "
    print b.win_diagonal?(mark).to_s.upcase
    puts

    print "does #{mark} win? "
    print b.win?(mark).to_s.upcase
    puts
end

def check_board_state(b)
    print "BOARD STATE:"
    puts
    print "empty spaces? "
    print b.empty_positions?.to_s.upcase
    puts

    check_mark_state(b, :X)
    puts
    check_mark_state(b, :O)
    puts
end

def test_out_of_bounds
    b = Board.new(3)
    b.place_mark([-1,0], :O)
    b.place_mark([0,-1], :O)
    b.place_mark([-1,-1], :O)
    b.place_mark([1,3], :X)
    b.place_mark([4,0], :X)
    b.place_mark([5,3], :X)
end

def test_occupied_space
    b = Board.new(3) # 3x3

    b.place_mark([1,2], :O)
    b.place_mark([1,2], :O)
end

def test_partial_fill_no_win
    print "test_partial_fill_no_win: "
    b = Board.new(3) # 3x3
    b.place_mark([0,0], :O)
    b.place_mark([2,1], :X)
    b.place_mark([1,0], :O)
    
    b.print
    check_board_state(b)
end

def test_full_fill_no_win
    print "test_full_fill_no_wins:"
    
    b = Board.new(3) # 3x3
    b.place_mark([0,0], :X)
    b.place_mark([0,1], :O)
    b.place_mark([0,2], :O)
    b.place_mark([1,0], :O)
    b.place_mark([1,1], :O)
    b.place_mark([1,2], :X)
    b.place_mark([2,0], :X)
    b.place_mark([2,1], :X)
    b.place_mark([2,2], :O)
    
    b.print
    check_board_state(b)
end

def test_first_diagonal_win
    print "test_first_diagonal_win:"
    
    b = Board.new(3) # 3x3
    b.place_mark([0,0], :O)
    b.place_mark([0,1], :O)
    b.place_mark([0,2], :X)
    b.place_mark([1,0], :O)
    b.place_mark([1,1], :O)
    b.place_mark([1,2], :X)
    b.place_mark([2,0], :X)
    b.place_mark([2,1], :X)
    b.place_mark([2,2], :O)
    
    b.print
    check_board_state(b)
end

def test_second_diagonal_win
    print "test_second_diagonal_win:"
    
    b = Board.new(3)
    b.place_mark([0,0], :O)
    b.place_mark([0,1], :O)
    b.place_mark([0,2], :X)
    b.place_mark([1,0], :O)
    b.place_mark([1,1], :X)
    b.place_mark([1,2], :X)
    b.place_mark([2,0], :X)
    b.place_mark([2,1], :O)
    b.place_mark([2,2], :O)
    
    b.print
    check_board_state(b)
end

def test_col_win
    print "test_col_win:"
  
    b = Board.new(3)
    b.place_mark([0,0], :X)
    b.place_mark([0,1], '_')
    b.place_mark([0,2], :X)
    b.place_mark([1,0], :O)
    b.place_mark([1,1], :O)
    b.place_mark([1,2], :X)
    b.place_mark([2,0], :X)
    b.place_mark([2,1], :O)
    b.place_mark([2,2], :X)
   
    b.print
    check_board_state(b)
end

def test_row_win
    print "test_row_win:"
  
    b = Board.new(3)
    b.place_mark([0,0], :X)
    b.place_mark([0,1], '_')
    b.place_mark([0,2], :X)
    b.place_mark([1,0], :O)
    b.place_mark([1,1], :O)
    b.place_mark([1,2], :O)
    b.place_mark([2,0], :X)
    b.place_mark([2,1], :O)
    b.place_mark([2,2], :X)
   
    b.print
    check_board_state(b)
end

def spacer
    print "--------------------------------------"
    puts
end


b = Board.new(3) # 3x3

# test_out_of_bounds
# test_occupied_space
spacer
test_partial_fill_no_win
spacer

test_full_fill_no_win
spacer

test_row_win
spacer

test_col_win
spacer

test_first_diagonal_win
spacer

test_second_diagonal_win