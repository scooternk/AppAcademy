def my_reject(arr, &block)
    are_false = []

    arr.each do |e|
        are_false << e if !block.call(e)
    end

    are_false
end

def my_one?(arr, &block)
    count = 0
    arr.each do |e|
        count += 1 if block.call(e)
    end
    count == 1
end

def hash_select(h, &block)
    new_hash = Hash.new
    
    h.each do |k, v|
        new_hash[k] = v if block.call(k,v)
    end

    new_hash
end

def xor_select(arr, prc1, prc2)
    selected = []

    arr.each do |e|
        selected << e if (prc1.call(e) ^ prc2.call(e))
    end
    selected
end

def proc_count(val, proc_array)
    num = 0

    proc_array.each { |prc| num += 1 if prc.call(val) }

    num
end