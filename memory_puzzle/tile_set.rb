class TileSet
    attr_reader :tiles, :hidden_val, :alphanumeric

    def initialize(tiles, hidden_val, alphanumeric)
        @tiles = tiles
        @hidden_val = hidden_val
        @alphanumeric = alphanumeric
    end

    def render
        @tiles.each {|t| print "\"#{t}\""}
        # true
    end

    def self.playing_cards
        TileSet.new((2..10).to_a.concat(['J','Q','K','A']), "", true)
    end

    def self.emoji_faces
        emojis = [
            "\u{1F600}", # grinning face
            "\u{1F970}", # smiling face with hearts
            "\u{1F92A}", # zany face
            "\u{1F634}", # sleeping face
            "\u{1F92F}", # exploding head
            "\u{1F60E}", # sunglasses
            "\u{1F632}", # astonished
            "\u{1F622}", # crying
            "\u{1F9D0}", # monocle
            "\u{1F973}", # party hat
            "\u{1F637}" # mask

        ]
        
        TileSet.new(emojis.concat(emojis), "\u{0020}\u{0020}\u{0020}", false)
    end

    
end

