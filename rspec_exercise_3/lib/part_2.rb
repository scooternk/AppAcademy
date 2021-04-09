def element_count(arr)
    h = Hash.new(0)

    arr.each do |e|
        h[e] += 1
    end

    h
end

def char_replace!(s, h)
    s.each_char.with_index do |c, i|
        if h[c]
           s[i] = h[c]
        end
    end
    s
end

def product_inject(arr)
    arr.inject {|acc, e| acc * e}
end