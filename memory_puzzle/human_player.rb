require_relative 'utils.rb'

class HumanPlayer

    def initialize(size)
        @board_size = size
    end

    def get_input
        pos = prompt

        while !valid_pos?(pos)
            puts "#{pos} is not a valid card position"
            pos = prompt
        end

        pos.split(',').map!(&:to_i)
    end

    def receive_revealed_card(pos, val)
        # nothing for now
    end

    def receive_match(p1, p2)
        # nothing for now
    end

    def prompt
        puts "Please enter the position of the card to flip (e.g. '2,3')..."
        gets.chomp
    end

    def valid_pos?(pos, board_size=@board_size)
        valid_pos_on_board?(pos, @board_size)
        # r,c = pos.split(',')
        # reg_exp = /^\d+$/

        # return false if !(reg_exp === r  && reg_exp === c)
        # valid = (1..@board_size)
        # valid.include?(r.to_i) && valid.include?(c.to_i)
    end

end