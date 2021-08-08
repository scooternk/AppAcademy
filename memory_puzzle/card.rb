class Card
    attr_reader :face_up, :face_value

    def initialize(face_value)
        @face_value = face_value
        @face_up = false
    end

    def hide
        @face_up = false
    end

    def reveal
        @face_up = true
    end

    def to_s
        return @face_value.to_s if @face_up
        return ""
    end

    def ==(obj)
        return false if obj.class != Card
        @face_value == obj.face_value
    end


end
