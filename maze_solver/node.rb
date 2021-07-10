require "colorize"

class Node
    @@START = :S
    @@END = :E
    @@WALL = :*
    @@CLEAR = :C
    @@PATH = :X
    @@UNKNOWN = :U

  def initialize(s)
    case s
        when "*"
            @type = @@WALL
        when " "
            @type = @@CLEAR
        when "S"
            @type = @@START
        when "E"
            @type = @@END
        else
            @type = @@UNKNOWN
        end
  end

  def color
    return :yellow  if is_wall?
    return :blue if is_path?
    return :red if is_start?
    return :green if is_end?
  end

  def is_wall?
    @type == @@WALL
  end

  def is_clear?
    @type == @@CLEAR
  end

  def is_start?
    @type == @@START
  end

  def is_end?
    @type == @@END
  end

  def is_path?
      @type == @@PATH
  end

  def to_s
    is_clear? ? " " : @type.to_s.colorize(color)
  end

end