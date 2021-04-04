class Room

    def initialize(capacity)
        @capacity = capacity
        @occupants = [] #Array.new(capacity)
    end

    def capacity
        @capacity
    end

    def occupants
        @occupants
    end

    def full?
        return true if @occupants.size == @capacity
        false
    end

    def available_space
        @capacity - @occupants.count
    end

    def add_occupant(name)
        if full?
            print "The room is full"
            return false
        end

        @occupants << name
        true
    end
end
