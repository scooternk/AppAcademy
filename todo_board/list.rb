require './item.rb'

class List
    attr_accessor :label

    class << self
        @@PRINT_WIDTH = 50
        @@INDEX_COL_WIDTH = 6
        @@ITEM_COL_WIDTH = 21
        @@DEADLINE_COL_WIDTH = 12
        @@DONE_COL_WIDTH = 5
        @@ROW_DIVIDER_CHAR = '-'
        @@COL_DIVIDER_CHAR = '|'
        @@DONE_FALSE = '[ ]'
        @@DONE_TRUE = '[✓]'
    end

    def initialize(label)
        @label = label
        @items = []
    end

    def add_item(title, deadline, description='')
        begin
            item = Item.new(title, deadline, description)
        rescue
            return false
        else
            @items << item
        end
        true
    end

    def toggle_item(index)
        index = index.to_i
        @items[index].toggle
    end

    def size
        @items.size
    end

    def swap(index_1, index_2)
        i1 = index_1.to_i
        i2 = index_2.to_i
        return false if (!valid_index?(i1) || !valid_index?(i2))
         
        @items[i1], @items[i2] = @items[i2], @items[i1]
        true
    end

    def [](index)
        @items[index]
    end

    def priority
        @items.first
    end

    def up(index, amount=1)
        move(index, true, amount)
    end

    def down(index, amount=1)
        move(index, false, amount)
    end

    def remove(index)
        index = index.to_i
        return false if !valid_index?(index)

        @items.delete_at(index)
    end

    def purge
        @items.delete_if {|e| e.done}
    end

    def sort_by_date!
        @items.sort_by! {|i| i.deadline}
    end

    def print
        puts
        print_header
        print_items
        print_list_footer
        puts
    end

    def print_full_item(index)
        i = index.to_i
        return if !valid_index?(i)
        
        puts
        print_row_divider
        puts
        item = @items[i]
        STDOUT.print item.title
        STDOUT.print item.deadline.rjust(@@PRINT_WIDTH-item.title.length-15)
        STDOUT.print " -- Done: #{item.done}"
        puts
        STDOUT.print item.description.ljust(@@PRINT_WIDTH)
        puts
        print_row_divider
        puts
    end

    def print_priority
        print_full_item(0)
    end


    private
    def valid_index?(index)
        i = index.to_i
        i >= 0 && i < @items.count
    end

    def move(index, up, amount=1)
        index = index.to_i
        amount = amount.to_i
        return false if !valid_index?(index)

        # these values control up/down movement through index
        edge = (up ?  0 : @items.size-1)
        increment = (up ?  -1 : 1)

        done = (index == edge)
        num_moves = 0
        while !done
            swap(index, index + increment)
            index += increment
            num_moves += 1
            done = (num_moves == amount || index == edge)
        end
        true
    end

    
    #################### PRINT METHODS ####################
    def print_header
        STDOUT.print print_row_divider
        puts
        STDOUT.print @label.upcase.center(@@PRINT_WIDTH, ' ')
        puts
        STDOUT.print print_row_divider
        puts
        STDOUT.print "#{format_index_for_display('Index')}#{@@COL_DIVIDER_CHAR}"
        STDOUT.print "#{format_item_for_display('Item')}#{@@COL_DIVIDER_CHAR}"
        STDOUT.print "#{format_deadline_for_display('Deadline')}#{@@COL_DIVIDER_CHAR}"
        STDOUT.print "#{format_done_for_display('Done')}"
        puts
        STDOUT.print print_row_divider
        puts
    end

    def print_items
        @items.each_with_index do |e, idx|
            STDOUT.print "#{format_index_for_display(idx)}#{@@COL_DIVIDER_CHAR}"
            STDOUT.print "#{format_item_for_display(e.title)}#{@@COL_DIVIDER_CHAR}"
            STDOUT.print "#{format_deadline_for_display(e.deadline)}#{@@COL_DIVIDER_CHAR}"
            STDOUT.print "#{format_done_for_display(e.done)}"
            puts
        end
    end

    def print_list_footer
        print_row_divider
        puts
    end
    
    def print_row_divider
        STDOUT.print  get_row_divider(@@ROW_DIVIDER_CHAR)
    end

    def get_row_divider(char)
        char * @@PRINT_WIDTH
    end

    def format_index_for_display(idx)
        idx.to_s.ljust(@@INDEX_COL_WIDTH)
    end

    def format_item_for_display(str)
        " " << str.ljust(@@ITEM_COL_WIDTH)
    end

    def format_deadline_for_display(str)
        " " << str.ljust(@@DEADLINE_COL_WIDTH)
    end

    def format_done_for_display(isDone)
        done = isDone ? @@DONE_TRUE : @@DONE_FALSE
        " " << done.ljust(@@DONE_COL_WIDTH)
    end
    ##################################################
    

end