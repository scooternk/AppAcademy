def reverser(str, &block)
    block.call(str.reverse)
end

def word_changer(sentence, &block)
    sentence.split(" ").map(&block).join(" ")
end

def greater_proc_value(num, proc1, proc2)
    [proc1.call(num), proc2.call(num)].max
end

def and_selector(array, proc1, proc2)
    array.select(&proc1).select(&proc2)
end

def alternating_mapper(array, proc1, proc2)
    array.map.with_index do |e, i|
        if(i.even?)
            proc1.call(e)
        else
            proc2.call(e)
        end
    end
end

