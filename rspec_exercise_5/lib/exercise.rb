# assumption: ea array is of same length
def zip(*arrays)
     zip_to_length(arrays.first.length, arrays)
end

# args are [length, [arrays...]]
# all args get gobbled into *arrays
# to get our array of arrays, need to index into arrays
def zip_to_length(length, *arrays)
    (0...length).map do |i|
        arrays[-1].map { |array| array[i] }
    end
end

def prizz_proc(array, tie_breaker1, tie_breaker2)
    array.select { |e| tie_breaker1.call(e) ^ tie_breaker2.call(e) }
end

def zany_zip(*arrays)
    length = arrays.map(&:length).max
    zip_to_length(length, arrays) 
end

def maximum(array, &block)
    return nil if array.empty?
    max = array.first
    array.each do |e|
        max = e if block.call(e) >= block.call(max)
    end
    max
end 

def my_group_by(array, &block)
    evals = Hash.new {|h, k| h[k] = []}
    array.each do |e|
        result = block.call(e)
        evals[result] << e # tie goes to the later array element
    end
    evals
end

def max_tie_breaker(array, tie_breaker, &block)
    return nil if array.empty?

    max = array.first

    array.each do |e|
        cur_val = block.call(e)
        max_val = block.call(max)
        if cur_val > max_val
            max = e
        elsif cur_val == max_val
            max = e if tie_breaker(e) > tie_breaker(max)
        end
    end
    max
end

def silly_syllables(sentence)
    vowels = 'aeiou'
    
    new_sentence = sentence.split(' ').map do |word|
        if word.count(vowels) < 2
            word
        else
            change_word(word)
        end
    end

    new_sentence.join(" ")
end

def change_word(word)
    vowel_regex = /[aeiou]/
    
    pieces = word.split(vowel_regex) #split word on vowels
    w = word.sub(pieces[0], "") #remove all chars before first vowel
    w = w.sub(pieces[-1], "") if !word[-1].index(vowel_regex) # remove all after last vowel, if word doesn't end in vowel
    w
end   