require './list.rb'

class TodoBoard
    attr_reader :list

    def initialize(label)
        @list = List.new(label)
    end

    def get_command
        print "\nEnter a command: "
        cmd, *args = gets.chomp.split(' ')
        return true if !cmd

        case cmd.upcase
        when 'MKTODO'
            @list.add_item(*args)
        when 'UP'
            @list.up(*args)
        when 'DOWN'
            @list.down(*args)
        when 'SWAP'
            @list.swap(*args)
        when 'SORT'
            @list.sort_by_date!
        when 'PRIORITY'
            @list.print_priority
        when 'PRINT'
            if (args.length > 0)
                @list.print_full_item(*args)
            else
                @list.print
            end 
        when 'QUIT'
            return false
        else
            print "Sorry, that command is not recognized."
        end

        true
    end

    def run
        while get_command
        end
    end


end
