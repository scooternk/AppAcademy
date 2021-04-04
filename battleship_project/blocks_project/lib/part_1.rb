def select_even_nums(nums)
    nums.select(&:even?)
end

def reject_puppies(dogs)
    dogs.reject {|dog| dog['age'] <= 2}
end

def count_positive_subarrays(array)
    array.count {|subarray| subarray.sum > 0}
end

def aba_translate(word)
    vowels = "aeiou"
    word.split("").map {|c| vowels.include?(c) ? c + "b" + c : c}.join
end

def aba_array(words)
    words.map {|w| aba_translate(w)}
end

