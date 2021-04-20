############################################################################################
############################################################################################
#                                       PHASE I
############################################################################################
############################################################################################
# Write a method duos that accepts a string as an argument and returns the count of the number of times 
# the same character appears consecutively in the given string.
def duos(s)
    cnt = 0
    (0...s.length - 1).each {|i| cnt += 1 if s.chars[i] == s.chars[i+1] }
    cnt
end


# Write a method sentence_swap that accepts a sentence and a hash as arguments. 
# The method should return a new sentence where every word is replaced with it's corresponding value in the hash. 
# If a word does not exist as a key of the hash, then it should remain unchanged.
def sentence_swap(sentence, h)
    sentence.split(" ").map do |word|
        w = word
        w = h[word] if h[word]
        w
    end.join(" ")
end


# Write a method hash_mapped that accepts a hash, a proc, and a block. 
# The method should return a new hash where each key is the result of the original key when given to the block. 
# Each value of the new hash should be the result of the original values when passed into the proc.
def hash_mapped(h, prc, &blk)
    new_hash = {}
    h.each {|k, v| new_hash[blk.call(k)] = prc.call(v) }
    new_hash
end


# Write a method counted_characters that accepts a string as an argument. 
# The method should return an array containing the characters of the string that appeared more than twice. 
# The characters in the output array should appear in the same order they occur in the input string.
def counted_characters(s)
    counted = Hash.new(0)

    s.chars.each {|c| counted[c] += 1 }
    counted.select {|k, v| v > 2}.keys
end


# Write a method triplet_true? that accepts a string as an argument and returns a boolean indicating 
# whether or not the string contains three of the same character consecutively.
def triplet_true?(s)
    s.match?(/(.)\1{2,}/)
end


# Write a method energetic_encoding that accepts a string and a hash as arguments. 
# The method should return a new string where characters of the original string are replaced with the corresponding values in the hash. 
# If a character is not a key of the hash, then it should be replaced with a question mark ('?'). Space characters (' ') should remain unchanged.
def energetic_encoding(s, h)
    s.chars.map do |c|
        if h[c]
            h[c]
        elsif c == ' '
            c
        else
            '?'
        end
    end.join("")
end


# Write a method uncompress that accepts a string as an argument. 
# The string will be formatted so every letter is followed by a number. 
# The method should return an "uncompressed" version of the string where every letter is repeated multiple times 
# given based on the number that appears directly after the letter.
def uncompress(s)
    s.scan(/([A-Za-z])(\d)+/).map { |e| e[0] * e[1].to_i }.join
end


############################################################################################
############################################################################################
#                                       PHASE II
############################################################################################
############################################################################################
# Write a method conjunct_select that accepts an array and one or more procs as arguments. 
# The method should return a new array containing the elements that return true when passed into all of the given procs.
def conjunct_select(a, *prcs)
    a.select { |e| prcs.all? {|p| p.call(e)} }
end

def pass_all_procs(e, *prcs)
    prcs.each {|p| return false if !p.call(e)}
    true
end


# Write a method convert_pig_latin that accepts a sentence as an argument. The method should translate the sentence according to the following rules:
# words that are shorter than 3 characters are unchanged
# words that are 3 characters or longer are translated according to the following rules:
# if the word begins with a vowel, simply add 'yay' to the end of the word (example: 'eat'->'eatyay')
# if the word begins with a non-vowel, move all letters that come before the word's first vowel to the end of the word and add 'ay' 
# (example: 'trash'->'ashtray')
# Note that if words are capitalized in the original sentence, they should remain capitalized in the translated sentence. 
# Vowels are the letters a, e, i, o, u.
def convert_pig_latin(sentence)
    vowels = "aeiou"
    sentence.split(" ").map do |word|
        if word.length >= 3
            if vowels.include? word[0].downcase
                word + "yay"
            else
                w = word.scan(/([^aeiou]+)([aeiou]{1}.+)/).map {|e| e[1] + e[0] + "ay"}.join("")
                if word[0] == word[0].upcase
                    w.downcase!.capitalize!
                end
                w
            end
        else
            word
        end
    end.join(" ")
end


# Write a method reverberate that accepts a sentence as an argument. The method should translate the sentence according to the following rules:
# words that are shorter than 3 characters are unchanged
# words that are 3 characters or longer are translated according to the following rules:
# if the word ends with a vowel, simply repeat the word twice (example: 'like'->'likelike')
# if the word ends with a non-vowel, repeat all letters that come after the word's last vowel, including the last vowel itself (example: 'trash'->'trashash')
# Note that if words are capitalized in the original sentence, they should remain capitalized in the translated sentence. 
# Vowels are the letters a, e, i, o, u.
def reverberate(sentence)
    vowels = "aeiou"
    sentence.split(" ").map do |word|
        if word.length >= 3
            if vowels.include? word.chars[-1]
                w = word * 2
            else
                w = word.reverse.scan(/([^aeiou]+[aeiou]{1})(.+)/).map {|e| word + e[0].reverse.downcase}.join("")
            end
            if word[0] == word[0].upcase
                w.downcase!.capitalize!
            end
            w
        else
            word
        end
    end.join(" ")
end

# Write a method disjunct_select that accepts an array and one or more procs as arguments. 
# The method should return a new array containing the elements that return true when passed into at least one of the given procs.
def disjunct_select(a, *prcs)
    a.select { |e| prcs.any? {|p| p.call(e)} }
end


# Write a method alternating_vowel that accepts a sentence as an argument. 
# The method should return a new sentence where the words alternate between having their first or last vowel removed. For example:
# the 1st word should be missing its first vowel
# the 2nd word should be missing its last vowel
# the 3rd word should be missing its first vowel
# the 4th word should be missing its last vowel
# ... and so on
# Note that words that contain no vowels should remain unchanged. Vowels are the letters a, e, i, o, u.
def alternating_vowel(sentence)
    vowels = "aeiou"
    sentence.split(" ").each_with_index.map do |word, i|
        if (i+1) % 2 == 0 # last vowel
            word.reverse.sub(/[aeiou]/, '').reverse
        else # first vowel
            word.sub(/[aeiou]/, '')
        end
    end.join(" ")
end


# Write a method silly_talk that accepts a sentence as an argument. 
# The method should translate each word of the sentence according to the following rules:
# if the word ends with a vowel, simply repeat that vowel at the end of the word (example: 'code'->'codee')
# if the word ends with a non-vowel, every vowel of the word should be followed by 'b' and that same vowel (example: 'siren'->'sibireben')
# Note that if words are capitalized in the original sentence, they should remain capitalized in the translated sentence. 
# Vowels are the letters a, e, i, o, u.
def silly_talk(sentence)
    vowels = "aeiou"
    sentence.split(" ").map do |word|
        if vowels.include? word.chars[-1]
            w = word + word.chars[-1]
        else
            w = word.gsub(/(?<v>[aeiouAEIOU])/, '\k<v>b\k<v>')
        end
        if word[0] == word[0].upcase
            w.downcase!.capitalize!
        end
        w
    end.join(" ")
end


# Write a method compress that accepts a string as an argument. 
# The method should return a "compressed" version of the string where streaks of consecutive letters 
# are translated to a single appearance of the letter followed by the number of times it appears in the streak. 
# If a letter does not form a streak (meaning that it appears alone), then do not add a number after it.
def compress(s)
    compressed = s
    compressed.to_enum(:scan, /(\w)\1+/).map { Regexp.last_match }.each { |m| compressed.gsub!(m[0], "#{m[1]}#{m[0].length}") }
    compressed
end