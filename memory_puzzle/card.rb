class Card
    attr_reader :face_up, :face_value, :back_value

    def initialize(face_value, back_value)
        @face_value = face_value
        @back_value = back_value
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
        return back_value
    end

    def ==(obj)
        return false if obj.class != Card
        @face_value == obj.face_value
    end

end