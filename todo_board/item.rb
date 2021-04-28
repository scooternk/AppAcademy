class Item
    attr_accessor :title, :deadline, :description, :done

    class << self
        def valid_date?(date_str)
            date_str.match?(/(\d{4})-(1[0-2]|0[1-9])-(0[1-9]|[1-2][0-9]|3[0-1])$/)
        end

    end

    def initialize(title, deadline, description="")
        @title = title
        @description = description
        @done = false

        handle_invalid_date(deadline)
        # raise "Invalid date: #{deadline}" if !Item.valid_date?(deadline)
        @deadline = deadline

    end

    def deadline=(date)
        handle_invalid_date(date)
        # raise "Invalid date: #{date}" if !Item.valid_date?(date)
        @deadline = date
    end

    def toggle
        @done = !@done
    end

    # makes more sense as private class method, but how to call from instance?
    private
    def handle_invalid_date(date)
        raise "Invalid date: #{date}" if !Item.valid_date?(date)
    end

    
end 