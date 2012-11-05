class Word
  attr_accessor :bits
  def initialize(*bits)
    @bits = bits
  end

  def length
    @bits.length
  end

  def to_s
    @bits.join('')
  end

  def to_int
    rev = bits.reverse
    sum = 0
    rev.each_index do |i|
      sum = sum + rev[i] * (2 ** i)
    end
    sum
  end
end

def empty_word(size)
  word = Word.new()
  word.bits = Array.new(size, 0)
  word
end
