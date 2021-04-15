# Write a method strange_sums that accepts an array of numbers as an argument. 
# The method should return a count of the number of distinct pairs of elements that have a sum of zero. 
# You may assume that the input array contains unique elements.
def strange_sums(nums)
    count = 0
    nums.combination(2) {|pair| count += 1 if pair[0] + pair[1] == 0}
    count
end

# Write a method pair_product that accepts an array of numbers and a product as arguments. 
# The method should return a boolean indicating whether or not a pair of distinct elements in the array result in the product when multiplied together. 
# You may assume that the input array contains unique elements.
def pair_product(nums, product)
    nums.combination(2) {|pair| return true if pair[0] * pair[1] == product}
    return false
end

# Write a method rampant_repeats that accepts a string and a hash as arguments. 
# The method should return a new string where characters of the original string are repeated the number of times specified by the hash. 
# If a character does not exist as a key of the hash, then it should remain unchanged.
def rampant_repeats(s, h)

end

# Write a method perfect_square? that accepts a number as an argument. 
# The method should return a boolean indicating whether or not the argument is a perfect square. 
# A perfect square is a number that is the product of some number multiplied by itself. 
# For example, since 64 = 8 * 8 and 144 = 12 * 12, 64 and 144 are perfect squares; 35 is not a perfect square.
def perfect_square?(num)

end

######################################################################################################################
###################################################### PHASE II ######################################################
######################################################################################################################
# Write a method anti_prime? that accepts a number as an argument. 
# The method should return true if the given number has more divisors than all positive numbers less than the given number. 
# For example, 24 is an anti-prime because it has more divisors than any positive number less than 24. 
# Math Fact: Numbers that meet this criteria are also known as highly composite numbers.
def anti_prime?(num)

end

# Let a 2-dimensional array be known as a "matrix". 
# Write a method matrix_addition that accepts two matrices as arguments. 
# The two matrices are guaranteed to have the same "height" and "width". 
# The method should return a new matrix representing the sum of the two arguments. 
# To add matrices, we simply add the values at the same positions:

# # programmatically
# [[2, 5], [4, 7]] + [[9, 1], [3, 0]] => [[11, 6], [7, 7]]

# # structurally
# 2 5  +  9 1  =>  11 6
# 4 7     3 0      7 7

def matrix_addition(m1, m2)

end

# Write a method mutual_factors that accepts any amount of numbers as arguments. 
# The method should return an array containing all of the common divisors shared among the arguments. 
# For example, the common divisors of 50 and 30 are 1, 2, 5, 10. 
# You can assume that all of the arguments are positive integers.
def mutual_factors(*nums)

end

# The tribonacci sequence is similar to that of Fibonacci. 
# The first three numbers of the tribonacci sequence are 1, 1, and 2. 
# To generate the next number of the sequence, we take the sum of the previous three numbers. 
# The first six numbers of tribonacci sequence are:

# 1, 1, 2, 4, 7, 13, ... and so on
# Write a method tribonacci_number that accepts a number argument, n, and returns the n-th number of the tribonacci sequence.
def tribonacci_number(n)

end

######################################################################################################################
###################################################### PHASE III #####################################################
######################################################################################################################
# Write a method matrix_addition_reloaded that accepts any number of matrices as arguments. 
# The method should return a new matrix representing the sum of the arguments. 
# Matrix addition can only be performed on matrices of similar dimensions, so if all of the given matrices do not have the same "height" and "width", then return nil.
def matrix_addition_reloaded(*matrices)

end

# Write a method squarocol? that accepts a 2-dimensional array as an argument. 
# The method should return a boolean indicating whether or not any row or column is completely filled with the same element. 
# You may assume that the 2-dimensional array has "square" dimensions, meaning it's height is the same as it's width.
def squarocol?(a)

end

# Pascal's triangle is a 2-dimensional array with the shape of a pyramid. 
# The top of the pyramid is the number 1. 
# To generate further levels of the pyramid, every element is the sum of the element above and to the left with the element above and to the right. 
# Nonexisting elements are treated as 0 when calculating the sum. For example, here are the first 5 levels of Pascal's triangle:

#       1
#      1 1
#     1 2 1
#    1 3 3 1
#   1 4 6 4 1

# Write a method pascals_triangle that accepts a positive number, n, as an argument 
# and returns a 2-dimensional array representing the first n levels of pascal's triangle.
def pascals_triangle(n)

end

######################################################################################################################
###################################################### PHASE IV ######################################################
######################################################################################################################

# A "Mersenne prime" is a prime number that is one less than a power of 2. 
# This means that it is a prime number with the form 2^x - 1, where x is some exponent. For example:

# 3 is a Mersenne prime because it is prime and 3 = 2^2 - 1
# 7 is a Mersenne prime because it is prime and 7 = 2^3 - 1
# 11 is not a Mersenne prime because although it is prime, it does not have the form 2^x - 1
# The first three Mersenne primes are 3, 7, and 31. 
# Write a method mersenne_prime that accepts a number, n, as an argument and returns the n-th Mersenne prime.
def mersenne_prime(n)

end

# A triangular number is a number of the form (i * (i + 1)) / 2 where i is some positive integer. 
# Substituting i with increasing integers gives the triangular number sequence. 
# The first five numbers of the triangular number sequence are 1, 3, 6, 10, 15. 
# Below is a breakdown of the calculations used to obtain these numbers:

# i	(i * (i + 1)) / 2
# 1	1
# 2	3
# 3	6
# 4	10
# 5	15
# We can encode a word as a number by taking the sum of its letters based on their position in the alphabet. 
# For example, we can encode "cat" as 24 because c is the 3rd of the alphabet, a is the 1st, and t is the 20th:

# 3 + 1 + 20 = 24

# Write a method triangular_word? that accepts a word as an argument and returns a boolean 
# indicating whethe
# A trr or not that word's number encoding is a triangular number. You can assume that the argument contains lowercase letters.
def triangular_word?(word)

end

# Write a method consecutive_collapse that accepts an array of numbers as an argument. 
# The method should return a new array that results from continuously removing consecutive numbers that are adjacent in the array. 
# If multiple adjacent pairs are consecutive numbers, remove the leftmost pair first. 
# For example:

# [3, 4, 1] -> [1]
# because 3 and 4 are consecutive and adjacent numbers, so we can remove them

# [1, 4, 3, 7] -> [1, 7]
# because 4 and 3 are consecutive and adjacent numbers, so we can remove them

# [3, 4, 5] -> [5]
# because 4 and 3 are consecutive and adjacent numbers, we don't target 4 and 5 since we should prefer to remove the leftmost pair

# We can apply this rule repeatedly until we cannot collapse the array any further:

# # example 1
# [9, 8, 4, 5, 6] -> [4, 5, 6] -> [6]

# # example 2
# [3, 5, 6, 2, 1] -> [3, 2, 1] -> [1]
def consecutive_collapse(nums)

end


# Write a method pretentious_primes that takes accepts an array and a number, n, as arguments. 
# The method should return a new array where each element of the original array is replaced according to the following rules:

# when the number argument is positive, replace an element with the n-th nearest prime number that is greater than the element
# when the number argument is negative, replace an element with the n-th nearest prime number that is less than the element

#     For example:

# if element = 7 and n = 1, then the new element should be 11 because 11 is the nearest prime greater than 7
# if the element = 7 and n = 2, then the new element should be 13 because 13 is the 2nd nearest prime greater than 7
# if the element = 7 and n = -1, then the new element should be 5 because 5 is the nearest prime less than 7
# if the element = 7 and n = -2, then the new element should be 3 because 3 is the 2nd nearest prime less than 7

# Note that we will always be able to find a prime that is greater than a given number 
# because there are an infinite number of primes (this is given by Euclid's Theorem). 
# However, we may be unable to find a prime that is smaller than a given number, because 2 is the smallest prime. 
# When a smaller prime cannot be calculated, replace the element with nil.

def pretentious_primes(a, n)

end
