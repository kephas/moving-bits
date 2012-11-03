class Word
  attr_accessor :bits
  def initialize(*bits)
    @bits = bits
  end
end

def empty_word(size)
  word = Word.new()
  word.bits = Array.new(size, 0)
  word
end
