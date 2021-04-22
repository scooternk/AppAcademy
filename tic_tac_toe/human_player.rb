class HumanPlayer
    attr_reader :mark

    def initialize(mark)
        @mark = mark
    end

    def get_position
        print "Player #{@mark}, enter two numbers representing a position in the format 'row column': "
        matches = gets.chomp!.match(/^(\d+)\s(\d+)$/)

        raise "Sorry, that's not valid" if !matches

        matches[1..-1].map(&:to_i)
    end

end