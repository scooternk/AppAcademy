def proper_factors(num)
    factors = []

    (1...num).each do |n|
        factors << n if n.positive? && num % n == 0
    end

    factors
end

def aliquot_sum(num)
    proper_factors(num).sum
end

def perfect_number?(num)
    return true if num == aliquot_sum(num)
    false
end

def ideal_numbers(n)
    ideals = []
    i = 1;

    while ideals.count < n do
        ideals << i if perfect_number?(i)
        i += 1
    end
    ideals
end