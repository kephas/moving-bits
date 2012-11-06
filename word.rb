class Word
  attr_accessor :bits
  def initialize(*bits)
    case bits[0]
      when Integer then @bits = bits
      when Array then @bits = bits[0]
    end
  end

  def length
    @bits.length
  end

  def expand(size)
    if size <= length() then
      Word.new(@bits)
    else
      Word.new(Array.new(size - length(), 0).concat(@bits))
    end
  end

  def expand!(size)
    @bits = expand(size).bits
    self
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
  Word.new([]).expand(size)
end

def int_to_word(int)
  def rec(unprocessed, bits)
    if unprocessed == 0 then
      Word.new(bits.reverse)
    else
      rec(unprocessed / 2, bits.push(unprocessed % 2))
    end
  end
  rec(int, [])
end
