def digit?(str)
    /^\d+$/ === str
end

def valid_pos_on_board?(pos, board_size)
    r,c = pos.split(',')

    return false if !(digit?(r)  && digit?(c))
    
    valid = (1..board_size)
    valid.include?(r.to_i) && valid.include?(c.to_i)
end