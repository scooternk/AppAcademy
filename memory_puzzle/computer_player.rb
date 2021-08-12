class ComputerPlayer
    attr_reader :known_cards, :matched_cards
    DEBUG = false

    def initialize(size)
        @known_cards = Hash.new # will be of form {[1,1]: "A", [3,2]: "Q", [4,2]: "Q"}
        @matched_cards = [] # will be of form [[[1,1], [1,2]], [[2,2], [1,4]]]
        @first_guess_pos = nil
        @board_size = size
    end

    # returns hash of form {card_value => [[pos1][pos2]], [[pos4], [pos5]]...} or empty {}
    # Note: finds ALL matches seen (including those already matched & uncovered)
    # NOTE this only returns cards where we've ONLY SEEN TWO! more than one and it won't be included...
    # TODO: rework this; if we have 3+ of a given card, must consider all viable permutations
    def matches_seen
        @known_cards.each_with_object({}) {|(pos,val), h| (h[val] ||= []) << pos}.select {|k,v| v.count == 2}
    end

    # returns hash of form {card_value => [[pos1][pos2][pos3]], [[pos4], [pos5]]...} or empty {}
    def possible_matches
        # get list of all known positions grouped by face value
        @known_cards.each_with_object({}) {|(pos,val), h| (h[val] ||= []) << pos}
        # remove any that are part of an existing match
        .transform_values {|a| a.reject {|pos| @matched_cards.flatten(1).include? pos}}
        # only take card with enough known positions to match
        .select{|face, positions| positions.count >=2}
    end

    # searches known matched pairs for any that include the given pos
    # returns its matching position or nil
    def get_known_match(pos)
        possible_matches.values.select{|set| set.include?(pos)}&.flatten(1)&.select{|p| p != pos}&.first
    end

    def matched_cards_include?(match)
        match.permutation(2).any? {|m| @matched_cards.include?(m)}
    end

    def get_input
        guess_pos = nil

        if !@first_guess_pos
            says "FIRST GUESS"
            # possible matches for guessing should exclude any in @matched_cards
            # matches we're aware of, but haven't been matched on board
            matches_to_try = possible_matches

            if matches_to_try.count > 0
                says "I know of these possible matches: #{matches_to_try}"
                says "These have already been matched: #{@matched_cards}"

                first_match = matches_to_try.values[0]
                says "I'll solve to match: #{first_match}"
                
                guess_pos = first_match[0]
            else
                says "No matches known; making random guess"
                guess_pos = guess_random_position
            end
            @first_guess_pos = guess_pos
            
        else
            says "SECOND guess"
            says "match for my first guess #{@first_guess_pos}? "
            match = get_known_match(@first_guess_pos)

            if match
                says "...there is! At #{match}"
                guess_pos = match
            else
                says "...NOPE. Make a random guess"
                guess_pos = guess_random_position
            end
            @first_guess_pos = nil
        end
        # sleep(2)
        guess_pos
    end

    def guess_random_position
        # as board gets larger, this becomes less performant?
        # TODO: consider keeping array of unknown positions
        indices = (1..@board_size).to_a
        pos = [indices.sample, indices.sample]

        while @known_cards.include? pos
            says "Known cards are: #{@known_cards}..."
            says "...I already know card at #{pos}, guessing again..."
            pos = [indices.sample, indices.sample]
            says "let's try #{pos}"
        end
        pos
    end

    def receive_revealed_card(pos, val)
        @known_cards[pos] = val if (pos && val)
    end

    def receive_match(pos1, pos2)
        @matched_cards << [pos1, pos2]
    end

    private
    def says(msg)
        puts msg if DEBUG
    end

end