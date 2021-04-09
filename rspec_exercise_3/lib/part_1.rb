def is_prime?(num)
    return false if num < 2
    return true if num == 2

    (2...num).each do |factor|
        return false if num % factor == 0
    end
    true
end

def nth_prime(n)
    primes = []
    i = 2

    while primes.count != n do
        primes << i if is_prime? i
        i+=1
    end
    primes[-1]
end

def prime_range(min, max)
    primes = []
    
    (min..max).each do |n|
        primes << n if is_prime? n
    end
    primes
end

