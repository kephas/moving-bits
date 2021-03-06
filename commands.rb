
class Show
  attr_accessor :word
  attr_accessor :operator
  attr_accessor :operand
  def initialize(word, operator = nil, operand = nil)
    @word = word
    @operator = operator
    @operand = operand
  end
end

class Move
  attr_accessor :direction # True is left
  attr_accessor :width
  def initialize(dir = True, width = 1)
    @direction = dir
    @width = width
  end
end

class Located_command
  attr_accessor :start
  attr_accessor :stop
  def initialize(start = 0, stop = -1)
    @start = start
    @stop = stop
  end
end

class Emphasis < Located_command
end

class Erase < Located_command
end
