class Code
  attr_reader :pegs

  POSSIBLE_PEGS = {
    "R" => :red,
    "G" => :green,
    "B" => :blue,
    "Y" => :yellow
  }

  # CLASS METHODS
  def self.valid_pegs?(pegs)
    pegs.all?{|peg| POSSIBLE_PEGS.include?(peg.upcase)}
  end

  def self.random(size)
    pegs = Array.new(size) { POSSIBLE_PEGS.keys.sample }
    Code.new(pegs)
  end

  def self.from_string(s)
    Code.new(s.chars)
  end

  # INSTANCE METHODS
  def initialize(pegs)
    if (!Code.valid_pegs?(pegs))
      raise "Invalid pegs found"
    elsif (Code.valid_pegs?(pegs))
      @pegs = pegs
      @pegs.map!(&:upcase)    
    end
  end
  
  def length
    @pegs.length
  end

  def [](index)
    @pegs[index]
  end

  def ==(code)
    # interate over all elements?
    # compare str or array? (easy if we expose Pegs)
    @pegs == code.pegs
  end

  #TOOO: for these methods, add check for length
  def num_exact_matches(code)
    matches = 0
    @pegs.each_with_index {|peg, i| matches += 1 if peg == code[i] }
    return matches
  end

  def num_near_matches(code)
    near_matches = 0
    code.pegs.each_with_index do |peg, i|
      
      if(peg != @pegs[i] && @pegs.include?(peg))
        near_matches += 1
      end
    end

    return near_matches
  end

end
