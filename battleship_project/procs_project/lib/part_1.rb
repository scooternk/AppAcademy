def my_map(array, &block)
    a = []
    array.each do |e|
        a << block.call(e)
    end
    return a
end

def my_select(array, &block)
    a = []
    array.each do |e|
        a << e if block.call(e)
    end
    return a
end

def my_count(array, &block)
    cnt = 0
    array.each do |e|
        cnt += 1 if block.call(e)
    end
    return cnt
end

def my_any?(array, &block)
    array.each do |e|
        return true if block.call(e)
    end
    return false
end

def my_all?(array, &block)
    array.each do |e|
        return false if !block.call(e)
    end
    return true
end

def my_none?(array, &block)
    array.each do |e|
        return false if block.call(e)
    end
    return true
end

