def average(num1, num2)
    (num1 + num2) / 2.0
end

def average_array(array)
    array.reduce {|acc, el| acc + el} / (array.size * 1.0)
end

def repeat(str, num)
    return str * num
end

def yell (str)
    str.upcase + "!"
end

def alternating_case(sentence)
    sentence.split(" ").map.with_index { |ele, i| i.even? ? ele.upcase : ele.downcase }.join(" ")
end