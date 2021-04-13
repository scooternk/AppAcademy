# assumption: ea array is of same length
def zip(*arrays)
    new_array = []
    
    (0...arrays[0].length).each do |i|
        sub = []
        arrays.each {|a| sub << a[i]}
        new_array << sub
    end
    p new_array
    new_array
end

def prizz_proc(array, prc1, prc2)
    true_eles = []
    array.each {|e| true_eles << e if prc1.call(e) ^ prc2.call(e)}
    true_eles
end

def zany_zip(*arrays)
    max_len = arrays.max { |x,y| x.length <=> y.length }.length
    
    # pad out arrays as needed
    arrays.each do |a|
        while a.length < max_len do
            a.push(nil)
        end
    end
    zip(*arrays)
end

def maximum(array, &block)
    return nil if array.empty?

    evals = Hash.new

    array.each do |e|
        result = block.call(e)
        evals[result] = e # tie goes to the later array element
    end

    evals[evals.keys.max]
end

def my_group_by(array, &block)
    evals = Hash.new {|h, k| h[k] = []}

    array.each do |e|
        result = block.call(e)
        evals[result] << e # tie goes to the later array element
    end
    evals
end

def max_tie_breaker(array, prc, &block)
    return nil if array.empty?

    evals = Hash.new

    array.each do |e|
        result = block.call(e)
        if evals[result] # have a tie (another element got here first) 
            p "have tie between #{evals[result]} and #{e}"
            # get vals to try and break tie; take largest result
            orig = prc.call(evals[result])
            current = prc.call(e)
            
            case orig <=> current
            when -1
                evals[result] = e
            when 0
                # do nothing, still tied -- keep the earlier array element
            when 1
                # do nothing -- orig wins the tie
            end
        else
            evals[result] = e
        end
    end
    evals[evals.keys.max]
end

def silly_syllables(sentence)

end