# Write a method no_dupes?(arr) that accepts an array as an arg 
# and returns an new array containing the elements that were not repeated in the array.

# # Examples
# no_dupes?([1, 1, 2, 1, 3, 2, 4])         # => [3, 4]
# no_dupes?(['x', 'x', 'y', 'z', 'z'])     # => ['y']
# no_dupes?([true, true, true])            # => []

def no_dupes?(arr)
    counts = Hash.new(0)
    arr.each do |e|
        counts[e] += 1
    end
    counts.select {|k,v| v <= 1}.keys
end
p "no_dupes?..."
p no_dupes?([1, 1, 2, 1, 3, 2, 4])         # => [3, 4]
p no_dupes?(['x', 'x', 'y', 'z', 'z'])     # => ['y']
p no_dupes?([true, true, true])            # => []


# Write a method no_consecutive_repeats?(arr) that accepts an array as an arg.
# The method should return true if an element never appears consecutively in the array;
# it should return false otherwise.

# # Examples
# no_consecutive_repeats?(['cat', 'dog', 'mouse', 'dog'])     # => true
# no_consecutive_repeats?(['cat', 'dog', 'dog', 'mouse'])     # => false
# no_consecutive_repeats?([10, 42, 3, 7, 10, 3])              # => true
# no_consecutive_repeats?([10, 42, 3, 3, 10, 3])              # => false
# no_consecutive_repeats?(['x'])                              # => true
def no_consecutive_repeats?(arr)
    (0...arr.length).each do |i|
        return false if arr[i] == arr[i+1]
    end
    true
end
p "no_consecutive_repeats?..."
p no_consecutive_repeats?(['cat', 'dog', 'mouse', 'dog'])     # => true
p no_consecutive_repeats?(['cat', 'dog', 'dog', 'mouse'])     # => false
p no_consecutive_repeats?([10, 42, 3, 7, 10, 3])              # => true
p no_consecutive_repeats?([10, 42, 3, 3, 10, 3])              # => false
p no_consecutive_repeats?(['x'])                              # => true

# Write a method char_indices(str) that takes in a string as an arg. 
# The method should return a hash containing characters as keys. 
# The value associated with each key should be an array containing the indices where that character is found.
# # Examples
# char_indices('mississippi')   # => {"m"=>[0], "i"=>[1, 4, 7, 10], "s"=>[2, 3, 5, 6], "p"=>[8, 9]}
# char_indices('classroom')     # => {"c"=>[0], "l"=>[1], "a"=>[2], "s"=>[3, 4], "r"=>[5], "o"=>[6, 7], "m"=>[8]}
def char_indices(str) 
    chars = Hash.new {|hash, k| hash[k] = Array.new}
    str.chars.each_with_index do |c, i|
        chars[c] << i 
    end
    chars
end
p "char_indices..."
p char_indices('mississippi')   # => {"m"=>[0], "i"=>[1, 4, 7, 10], "s"=>[2, 3, 5, 6], "p"=>[8, 9]}
p char_indices('classroom')     # => {"c"=>[0], "l"=>[1], "a"=>[2], "s"=>[3, 4], "r"=>[5], "o"=>[6, 7], "m"=>[8]}

# Write a method longest_streak(str) that accepts a string as an arg. 
# The method should return the longest streak of consecutive characters in the string. 
# If there are any ties, return the streak that occurs later in the string.

# # Examples
# longest_streak('a')           # => 'a'
# longest_streak('accccbbb')    # => 'cccc'
# longest_streak('aaaxyyyyyzz') # => 'yyyyy
# longest_streak('aaabbb')      # => 'bbb'
# longest_streak('abc')         # => 'c'
def longest_streak(str)
    throw "String expected" if str.length == 0

    curr_streak, longest = "", ""
    streak_char = str[0]
    str.chars.each do |c|
        if c == streak_char
            curr_streak += c
        else #reset
            streak_char = curr_streak = c
        end
        longest = curr_streak if curr_streak.length >= longest.length
    end
    longest
end
p "longest_streak..."
p longest_streak('a')           # => 'a'
p longest_streak('accccbbb')    # => 'cccc'
p longest_streak('aaaxyyyyyzz') # => 'yyyyy
p longest_streak('aaabbb')      # => 'bbb'
p longest_streak('abc')         # => 'c'

# Write a method bi_prime?(num) that accepts a number as an arg and returns a boolean 
# indicating whether or not the number is a bi-prime. 
# A bi-prime is a positive integer that can be obtained by multiplying two prime numbers.

# For Example:
# 14 is a bi-prime because 2 * 7
# 22 is a bi-prime because 2 * 11
# 25 is a bi-prime because 5 * 5
# 24 is not a bi-prime because no two prime numbers have a product of 24

# # Examples
# bi_prime?(14)   # => true
# bi_prime?(22)   # => true
# bi_prime?(25)   # => true
# bi_prime?(94)   # => true
# bi_prime?(24)   # => false
# bi_prime?(64)   # => false
def bi_prime?(num)
    prime_factors = []
    (2...num).each do |factor|
        if num % factor == 0
            prime_factors << factor if prime?(factor) # could use Prime class...do this for practice
        end
    end

    # do any of our prime factors have our num param as a product
    (0...prime_factors.length).each do |i|
        (i...prime_factors.length).each do |j|
            return true if (prime_factors[i] * prime_factors[j]) == num
        end
    end
    false
end

def prime?(num)
    (2...num).each { |n| return false if (num % n == 0) }
    true
end
p "bi_prime?..."
p bi_prime?(14)   # => true
p bi_prime?(22)   # => true
p bi_prime?(25)   # => true
p bi_prime?(94)   # => true
p bi_prime?(24)   # => false
p bi_prime?(64)   # => false

# Write a method vigenere_cipher(message, keys) that accepts a string and a key-sequence as args, 
# returning the encrypted message. Assume that the message consists of only lowercase alphabetic characters.

# # Examples
# vigenere_cipher("toerrishuman", [1])        # => "upfssjtivnbo"
# vigenere_cipher("toerrishuman", [1, 2])     # => "uqftsktjvobp"
# vigenere_cipher("toerrishuman", [1, 2, 3])  # => "uqhstltjxncq"
# vigenere_cipher("zebra", [3, 0])            # => "ceerd"
# vigenere_cipher("yawn", [5, 1])             # => "dbbo"
def vigenere_cipher(message, keys)
    alphabet = ("a".."z").to_a
    cipher = message.chars.map.with_index do |c, i|
        # determine which key to use based on position in the message
        offset = keys[i % keys.length]
        new_idx = (alphabet.index(c) + offset) % 26
        alphabet[new_idx]
    end
    cipher.join("")
end
p "vigenere_cipher..."
p vigenere_cipher("toerrishuman", [1])        # => "upfssjtivnbo"
p vigenere_cipher("toerrishuman", [1, 2])     # => "uqftsktjvobp"
p vigenere_cipher("toerrishuman", [1, 2, 3])  # => "uqhstltjxncq"
p vigenere_cipher("zebra", [3, 0])            # => "ceerd"
p vigenere_cipher("yawn", [5, 1])             # => "dbbo"
p "-------------------"

# Write a method vowel_rotate(str) that accepts a string as an arg 
# and returns the string where every vowel is replaced with the vowel 
# that appears before it sequentially in the original string. 
# The first vowel of the string should be replaced with the last vowel.

# # Examples
# vowel_rotate('computer')      # => "cempotur"
# vowel_rotate('oranges')       # => "erongas"
# vowel_rotate('headphones')    # => "heedphanos"
# vowel_rotate('bootcamp')      # => "baotcomp"
# vowel_rotate('awesome')       # => "ewasemo"
def vowel_rotate(str)
    vowels = "aeiou"
    orig_vowels = []
    rotated = str

    str.chars.each {|c| orig_vowels << c if vowels.include?(c)}

    rotated.chars.each_with_index do |c, i|
        if vowels.include?(c)
            rotated[i] = orig_vowels[-1]
            orig_vowels << orig_vowels.shift
        end
    end
    rotated
end
p "vowel_rotate..."
p vowel_rotate('computer')      # => "cempotur"
p vowel_rotate('oranges')       # => "erongas"
p vowel_rotate('headphones')    # => "heedphanos"
p vowel_rotate('bootcamp')      # => "baotcomp"
p vowel_rotate('awesome')       # => "ewasemo"
p "-------------------"

class String
    # Extend the string class by defining a String#select method that accepts a block. 
    # The method should return a new string containing characters of the original string 
    # that return true when passed into the block. If no block is passed, then return 
    # the empty string. Do not use the built-in Array#select in your solution.

    # # Examples
    # "app academy".select { |ch| !"aeiou".include?(ch) }   # => "pp cdmy"
    # "HELLOworld".select { |ch| ch == ch.upcase }          # => "HELLO"
    # "HELLOworld".select          # => ""
    def select(&prc)
        return "" if prc.nil?
        
        s = ""
        self.chars.each do |c|
            s << c if prc.call(c)
        end

        s
    end


    # Extend the string class by defining a String#map! method that accepts a block. 
    # The method should modify the existing string by replacing every character 
    # with the result of calling the block, passing in the original character and it's index. 
    # Do not use the built-in Array#map or Array#map! in your solution.

    # Examples
    # word_1 = "Lovelace"
    # word_1.map! do |ch| 
    #     if ch == 'e'
    #         '3'
    #     elsif ch == 'a'
    #         '4'
    #     else
    #         ch
    #     end
    # end
    # p word_1        # => "Lov3l4c3"

    # word_2 = "Dijkstra"
    # word_2.map! do |ch, i|
    #     if i.even?
    #         ch.upcase
    #     else
    #         ch.downcase
    #     end
    # end
    # p word_2        # => "DiJkStRa"
    def map!(&prc)
        self.chars.each_with_index do |c, i|
            self[i] =  prc.call(c, i)
        end
    end
end
p "Test String.select extension..."
p "app academy".select { |ch| !"aeiou".include?(ch) }   # => "pp cdmy"
p "HELLOworld".select { |ch| ch == ch.upcase }          # => "HELLO"
p "HELLOworld".select          # => ""

word_1 = "Lovelace"
word_1.map! do |ch| 
    if ch == 'e'
        '3'
    elsif ch == 'a'
        '4'
    else
        ch
    end
end
p word_1        # => "Lov3l4c3"

word_2 = "Dijkstra"
word_2.map! do |ch, i|
    if i.even?
        ch.upcase
    else
        ch.downcase
    end
end
p word_2        # => "DiJkStRa"


# Write a method multiply(a, b) that takes in two numbers and returns their product.

# You must solve this recursively (no loops!)
# You must not use the multiplication (*) operator
# # Examples
# multiply(3, 5)        # => 15
# multiply(5, 3)        # => 15
# multiply(2, 4)        # => 8
# multiply(0, 10)       # => 0
# multiply(-3, -6)      # => 18
# multiply(3, -6)       # => -18
# multiply(-3, 6)       # => -18
def multiply(a, b)
    if (a.negative? && b.negative?)
        a *= -1
        b *= -1
    elsif(a.negative? || b.negative?)
        a, b = a.abs * -1, b.abs
    end

    return a if b == 1
    return a + multiply(a, b-1)
end
p multiply(3, 5)        # => 15
p multiply(5, 3)        # => 15
p multiply(2, 4)        # => 8
p multiply(0, 10)       # => 0
p multiply(-3, -6)      # => 18
p multiply(3, -6)       # => -18
p multiply(-3, 6)       # => -18

# The Lucas Sequence is a sequence of numbers. 
# The first number of the sequence is 2. 
# The second number of the Lucas Sequence is 1. 
# To generate the next number of the sequence, we add up the previous two numbers. 
# For example, the first six numbers of the sequence are: 2, 1, 3, 4, 7, 11, ...

# Write a method lucasSequence that accepts a number representing a length as an arg. 
# The method should return an array containing the Lucas Sequence up to the given length. 
# Solve this recursively.

# # Examples
# lucas_sequence(0)   # => []
# lucas_sequence(1)   # => [2]    
# lucas_sequence(2)   # => [2, 1]
# lucas_sequence(3)   # => [2, 1, 3]
# lucas_sequence(6)   # => [2, 1, 3, 4, 7, 11]
# lucas_sequence(8)   # => [2, 1, 3, 4, 7, 11, 18, 29]
def lucas_sequence(len)
    seq = []
    case len
    when 0 then return seq
    when 1 then return [2]
    when 2 then return [2, 1]
    else
        prevSeq = lucas_sequence(len-1)
        newVal = prevSeq[-2] + prevSeq[-1]
        return prevSeq << newVal
    end
end

p "------------------lucas_sequence------------------"
p lucas_sequence(0)   # => []
p lucas_sequence(1)   # => [2]    
p lucas_sequence(2)   # => [2, 1]
p lucas_sequence(3)   # => [2, 1, 3]
p lucas_sequence(6)   # => [2, 1, 3, 4, 7, 11]
p lucas_sequence(8)   # => [2, 1, 3, 4, 7, 11, 18, 29]


# The Fundamental Theorem of Arithmetic states that every positive integer 
# is either a prime or can be represented as a product of prime numbers.

# Write a method prime_factorization(num) that accepts a number and returns an array 
# representing the prime factorization of the given number. 
# This means that the array should contain only prime numbers that multiply together to the given num. 
# The array returned should contain numbers in ascending order. Do this recursively.

# # Examples
# prime_factorization(12)     # => [2, 2, 3]
# prime_factorization(24)     # => [2, 2, 2, 3]
# prime_factorization(25)     # => [5, 5]
# prime_factorization(60)     # => [2, 2, 3, 5]
# prime_factorization(7)      # => [7]
# prime_factorization(11)     # => [11]
# prime_factorization(2017)   # => [2017]
def prime_factorization(num)
    #return [num] if prime?(num)
end

p "------------------prime_factorization------------------"
# p prime_factorization(12)     # => [2, 2, 3]
# p prime_factorization(24)     # => [2, 2, 2, 3]
# p prime_factorization(25)     # => [5, 5]
# p prime_factorization(60)     # => [2, 2, 3, 5]
#  p prime_factorization(7)      # => [7]
# p prime_factorization(11)     # => [11]
# p prime_factorization(2017)   # => [2017]