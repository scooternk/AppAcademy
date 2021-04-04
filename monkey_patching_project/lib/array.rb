# Monkey-Patch Ruby's existing Array class to add your own custom methods
class Array
  def span
    return nil if self.length == 0
    self.max - self.min
  end

  def average
    return nil if self.length == 0
    (self.sum * 1.0)/ self.length
  end

  def median
    return nil if self.length == 0

    mid = self.length / 2
    sorted = self.sort

    if sorted.length % 2 == 0
        (sorted[mid-1] + sorted[mid]) / 2.0
    else
        sorted[mid]        
    end
  end

  def counts
    h = Hash.new(0)
    self.each {|e| h[e] +=1}
    return h
  end

  def my_count(value)
    self.select {|e| e == value}.count
  end

  def my_index(value)
    self.each_with_index do |e,i| 
      return i if e == value
    end
    nil
  end

  def my_uniq
    self.counts.keys
  end

  def my_transpose
    new2d = Array.new(self[0].size) {Array.new(self.size)}

    self.each_with_index do |row, i|
      row.each_with_index do |col, j|
        new2d[j][i] = self[i][j]
      end
    end
    return new2d
  end

end
