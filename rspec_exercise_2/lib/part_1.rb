def partition(array, num)
    [array.select {|i| i < num}, array.select {|i| i >= num} ]
end

def merge(hash1, hash2)
    # didn't specify not to use hash.merge...?
    hash1.merge(hash2)
end

def censor(sentence, curse_words)
    word_array = sentence.split(" ").map do |word|
        if curse_words.include?(word.downcase)
            word.gsub(/([aeiouAEIOU])/, '*')
        else
           word 
        end
    end
    word_array.join(" ")
end

def power_of_two?(num)
    i = num
    while i != 1
        return false if i.odd?
        i = i / 2
    end
    true
end
