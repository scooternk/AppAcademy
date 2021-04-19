##################################################################################################
##################################################################################################
#                                           PHASE I
##################################################################################################
##################################################################################################
# Write a method some? that accepts an array and a block as arguments. 
# The method should return a boolean indicating whether or not at least one of the elements of the array returns true when given to the block. 
# Solve this using Array#each.
def some?(a, &prc)
    a.each do |e|
        return true if prc.call(e)
    end
    false
end


# Write a method exactly? that accepts an array, a number (n), and a block as arguments. 
# The method should return a boolean indicating whether or not there are exactly n elements that return true when given to the block. 
# Solve this using Array#each.
def exactly?(a, n, &prc)
    cnt = 0
    a.each do |e|
        cnt +=1 if prc.call(e)
        return false if cnt > n
    end
    cnt == n
end

# Write a method filter_out that accepts an array and a block as arguments.
# The method should return a new array where elements of the original array are removed if they return true when given to the block. 
# Solve this using Array#each.
def filter_out(a, &prc)
    new_array = []
    a.each do |e|
        new_array << e if !prc.call(e)
    end
    new_array
end


# Write a method at_least? that accepts an array, a number (n), and a block as an arguments. 
# The method should return a boolean indicating whether or not at least n elements of the array return true when given to the block.
#  Solve this using Array#each.
def at_least?(a, n, &prc)
    cnt = 0
    a.each do |e|
        cnt +=1 if prc.call(e)
        return true if cnt >= n
    end
    false
end



# Write a method every? that accepts an array and a block as arguments. 
# The method should return a boolean indicating whether or not all elements of the array return true when given to the block. 
# Solve this using Array#each.
def every?(a, &prc)
    a.each do |e|
        return false if !prc.call(e)
    end
    true
end



# Write a method at_most? that accepts an array, a number (n), and a block as arguments. 
# The method should return a boolean indicating whether no more than n elements of the array return true when given to the block. 
# Solve this using Array#each.
def at_most?(a, n, &prc)
    cnt = 0
    a.each do |e|
        cnt +=1 if prc.call(e)
        return false if cnt > n
    end
    cnt <= n
end


# Write a method first_index that accepts an array and a block as arguments. 
# The method should return the index of the first element of the array that returns true when given to the block. 
# If no element of returns true, then the method should return nil. Solve this using Array#each.
def first_index(a, &prc)
    a.each_with_index do |e, i|
        return i if prc.call(e)
    end
    nil
end

##################################################################################################
##################################################################################################
#                                           PHASE II
##################################################################################################
##################################################################################################

# Write a method xnor_select that accepts an array and two procs as arguments. 
# The method should return a new array containing elements of the original array that either return true for both procs or return false for both procs.
def xnor_select(a, prc1, prc2)
    a.select {|e| (prc1.call(e) && prc2.call(e)) || (!prc1.call(e) && !prc2.call(e))}
end


# Rewrite your previous filter_out method to mutate the input array instead of returning a new array. 
# That is, write a method filter_out! that accepts an array and a block as args. 
# The method should remove elements of the input array that return true when given to the block. 
# Solve this without using Array.reject!.
def filter_out!(a, &prc)
   a.delete_if {|e| prc.call(e)}
end



# Write a method multi_map that accepts an array, an optional number (n), and a block as arguments. 
# The method should return a new array where each element of the original array is repeatedly run through the block n times. 
# If the number argument is not passed in, then the the elements should be run through the block once.
def multi_map(a, n=1, &prc)
    a.map do |e|
        item = e
        n.times do 
            item =  prc.call(item)
        end
        item
    end
end


# Write a method proctition that accepts an array and a block as arguments. 
# The method should return a new array where the elements that return true when given to the block 
# come before all of the elements that return false when given to the block. 
# This means that the new array has two partitions; 
# the order among elements in the same partition should be the same as their relative order in the input array.
def proctition(a, &prc)
    part_true, part_false = [], []
    a.each do |e|
        if prc.call(e)
            part_true << e
        else
            part_false << e
        end
    end
    part_true.concat(part_false)
end



##################################################################################################
##################################################################################################
#                                           PHASE III
##################################################################################################
##################################################################################################

# Write a method selected_map! that accepts an array and two procs as arguments. 
# The method should replace the elements that return true 
# when passed into the first proc with their return values when they are passed into the second proc. 
# This method should mutate the input array and return nil.

def selected_map!(a, prc1, prc2)
    a.map! do |e|
        if prc1.call(e)
            prc2.call(e)
        else
            e
        end
    end
    nil
end


# Write a method that accepts any value and an array of procs as an argument. 
# The method should return the final result of feeding the value through all of the procs. 
# For example, if the array contains three procs, then:
# the value is given to the first proc
# the result of the first proc is given to the second proc
# the result of the second proc is given to the third proc
# the result of third proc is the final result
def chain_map(v, *prcs)
    mutated = v
    prcs[0].each do |proc|
        mutated = proc.call(mutated)
    end
    mutated
end


# Write a method proc_suffix that accepts a sentence and a hash as arguments. 
# The hash contains procs as keys and suffix strings as values. 
# The method should return a new sentence where each word of the original sentence is appended with a suffix 
# if the original word returns true when given to the corresponding proc key. 
# If an original word returns true for multiple procs, then the suffixes should be appended in the order that they appear in the input hash.
def proc_suffix(sentence, hash)
    sentence.split(" ").map do |word|
        modified = word
        hash.each { |proc, sfx| modified += sfx if proc.call(word) }
        modified
    end
end


# Write a method proctition_platinum that accepts an array and any number of additional procs as arguments. 
# The method should return a hash where the keys correspond to the number of procs passed in.

# For example, if three procs are passed in, then the hash should have the keys 1, 2, and 3.
# The values associated with each key should be an array containing the elements of the input array that return true when passed into the corresponding proc.

# For example, this means that the array that corresponds to the key 2 should contain the elements that return true when passed into the second proc.

# If an element returns true for multiple procs, then it should only be placed into the array that corresponds to the proc that appears first in the arguments.
def proctition_platinum(a, *prcs)
    h = {}
    testing = a

    prcs.each_with_index do |p, i|
        are_true = testing.select {|e| p.call(e)}
        to_save = are_true.difference(h.values) 
        h[i+1] = to_save
        testing = testing.difference(to_save) # going forward only test values which haven't yet been saved
    end
    h
end



# Write a method procipher that accepts a sentence and a hash as arguments. 
# The hash contains procs as both keys and values. 
# The method should return a new sentence where each word of the input sentence is changed by a value proc 
# if the original word returns true when passed into the key proc. 
# If an original word returns true for multiple key procs, then the value proc changes should be applied in the order that they appear in the hash.

def procipher(sentence, hash, picky=false)
    sentence.split(" ").map do |word|
        modified = word
        hash.keys.each do |key_proc|
            if key_proc.call(word)
                modified = hash[key_proc].call(modified)
                break if picky
            end
        end
        modified
    end.join(" ")
end



# Write a method picky_procipher that accepts a sentence and a hash as arguments. 
# The hash contains procs as both keys and values. 
# The method should return a new sentence where each word of the input sentence is changed by a value proc 
# if the original word returns true when passed into the key proc. 
# If an original word returns true for multiple key procs, then only the value proc that appears earliest in the hash should be applied.
def picky_procipher(sentence, hash)
    procipher(sentence, hash, true)
end
