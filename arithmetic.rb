=begin
These classes implement arithmetic operations for unbounded natural
integers (i.e. positive integers without the possibility of overflow)
=end

require 'word'

class Add
  attr_accessor :result
  attr_accessor :animate

  def initialize(word1, word2)
    @word1 = word1
    @word2 = word2

    _store_result
    _store_animate
  end

  def _store_result
    @result = int_to_word(@word1.to_int + @word2.to_int)
  end

  def _store_animate
    @animate = []
  end
end
