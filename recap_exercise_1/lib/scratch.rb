words = ["goat", "action", "tear", "impromptu", "tired", "europe"]

mapping = Hash.new() {|hash, k| hash[k] =  k.scan(/[aeiou]/) }

#creates hash of words and arrays of their vowels
words.each {|w| mapping[w]}
print mapping