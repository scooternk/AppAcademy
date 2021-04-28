require './list.rb'

class TodoBoard
    attr_reader :list

    class << self
        @@CMD_QUIT = 'QUIT'
        @@CMD_EXIT = 'EXIT'
        @@CMD_MKLIST = 'MKLIST'
        @@CMD_MKTODO = 'MKTODO'
        @@CMD_PRINT = 'PRINT'
        @@CMD_SORT = 'SORT'
        @@CMD_SHOWALL = 'SHOWALL'
        @@CMD_SWAP = 'SWAP'
        @@CMD_PRIORITY = 'PRIORITY'
        @@CMD_DOWN = 'DOWN'
        @@CMD_UP = 'UP'
        @@CMD_REMOVE = 'RM'
        @@CMD_LS = 'LS'
        @@CMD_TOGGLE = 'TOGGLE'
        @@CMD_PURGE = 'PURGE'

        @@no_args_needed = [@@CMD_QUIT, @@CMD_EXIT, @@CMD_SHOWALL, @@CMD_LS]

        def requires_args(cmd)
            !@@no_args_needed.include?(cmd.upcase)
        end
    end
    
    def initialize
        @lists = {}
    end

    def get_command
        print "\nEnter a command: "
        cmd, list, *args = gets.chomp.split(' ')
        return true if !cmd

        cmd = cmd.upcase
        if TodoBoard.requires_args(cmd)
             if !list
                print "#{cmd} requires a specified todo list"
                return true
             elsif (cmd != @@CMD_MKLIST && !@lists[list])
                print "Sorry, list #{list} doesn't exist" 
                return true
             end
        end

    begin
        case cmd
        when @@CMD_MKLIST
            @lists[list] = List.new(list)
        when @@CMD_MKTODO
            @lists[list].add_item(*args)
        when @@CMD_UP
            @lists[list].up(*args)
        when @@CMD_DOWN
            @lists[list].down(*args)
        when @@CMD_SWAP
            @lists[list].swap(*args)
        when @@CMD_SORT
            @lists[list].sort_by_date!
        when @@CMD_PRIORITY
            @lists[list].print_priority
        when @@CMD_PRINT
            if (args.length > 0)
                @lists[list].print_full_item(*args)
            else
                @lists[list].print
            end
        when @@CMD_LS
            @lists.each {|k, v| STDOUT.print "#{k}\n"}
        when @@CMD_SHOWALL
            @lists.each {|k, v| v.print}
        when @@CMD_TOGGLE
            @lists[list].toggle_item(*args)
        when @@CMD_REMOVE
            @lists[list].remove(*args)
        when @@CMD_PURGE
            @lists[list].purge
        when @@CMD_QUIT
            return false
        when @@CMD_EXIT
            return false
        else
            print "Sorry, that command is not recognized."
        end
    rescue StandardError => e
        puts "#{e.message}"
    end
        true
    end

    def run
        while get_command
        end
    end
end 

my_board = TodoBoard.new()
my_board.run
