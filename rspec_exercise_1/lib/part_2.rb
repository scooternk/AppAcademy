def hipsterfy(word)
    i = word.rindex(/[aeiou]/)

    if !i.nil?
        word[i] = ""
    end
    
    return word
end

def vowel_counts(str)
    vowels = "aeiou"
    counts = Hash.new(0)

    str.downcase.chars.each do |c|
        if vowels.include? c
            counts[c] += 1
        end
    end

    return counts
end

def caesar_cipher(msg, num)
    cipher = []
    orig = msg.split("")
    alphabet = ('a'..'z').to_a

    cipher = orig.map do |c|
        idx = alphabet.index(c)
        idx.nil? ? c :alphabet[(idx + num) % 26]
    end

    return cipher.join("")
end