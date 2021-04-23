class HumanPlayer
    attr_reader :mark

    def initialize(mark)
        @mark = mark
    end

    def get_position(legal_positions)
        begin
            print "Player #{@mark}, enter two numbers representing a position in the format 'row column': "

            matches = gets.chomp!.match(/^(\d+)\s(\d+)$/)
            raise "Sorry, that's not valid" if !matches

            position = matches[1..-1].map(&:to_i)
            raise "Sorry, that's not an available move" if !legal_positions.include?(position)
        rescue StandardError => e
            puts "#{e.message}"
            retry
        end
        position
    end

end