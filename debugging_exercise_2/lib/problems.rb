require 'prime'
# Run `bundle exec rspec` and satisy the specs.
# You should implement your methods in this file.
# Feel free to use the debugger when you get stuck.

def largest_prime_factor(num)
    (2..num).reverse_each do |factor|
        if (num % factor == 0 && Prime.prime?(factor))
            return factor
        end
    end
end

def unique_chars?(string)
    hash = Hash.new(0)

    string.each_char.with_index {|c, i| hash[c] += 1}

    !hash.any? {|k, v| v > 1}
end

def dupe_indices(array)
    hash = Hash.new {|h, k| h[k] = [] }

    array.each_with_index { |ele, idx|  hash[ele] << idx }

    hash.select {|k, v| v.count > 1}
end

def ana_array(array1, array2)
    a1 = array1.uniq
    a2 = array2.uniq

    return false if a1.length != a2.length

    a1.each do |e1|
        return false if !a2.include? e1
    end
    return true
end