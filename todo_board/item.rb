class Item
    attr_accessor :title, :deadline, :description

    class << self
        def valid_date?(date_str)
            date_str.match?(/(\d{4})-(1[0-2]|0[1-9])-(0[1-9]|[1-2][0-9]|3[0-1])$/)
        end

        # how to create a private method to raise/handle errors?
        # private
        # def handle_invalid_date(date)
        #     raise "Invalid date: date"
        # end
    end

    def initialize(title, deadline, description="")
        @title = title
        @description = description

        raise "Invalid date: #{deadline}" if !Item.valid_date?(deadline)
        @deadline = deadline

    end

    def deadline=(date)
        raise "Invalid date: #{date}" if !Item.valid_date?(date)
        @deadline = date
    end
    
end 