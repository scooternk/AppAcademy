def palindrome?(str)
    str.chars.each_with_index { |c, i| return false if str[i] != str[str.length - (i+1)] }
    true
end

def substrings(str)
    array = []

    str.chars.each_with_index do |c, i|
        len = 0
        (i...str.length).each do |i2|
            len += 1
            array << str.slice(i, len)
        end
    end

    return array
end

def palindrome_substrings(str)
    substrings(str).select { |s| s.length > 1 && palindrome?(s) }
end