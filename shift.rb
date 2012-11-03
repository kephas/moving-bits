exemple = Word.initialize(1,0)

class Shift
  attr_accessor :word
  attr_accessor :orientation
  attr_accessor :length
  
  def initialize(word, orientation, length)
    @word = word
    @orientation = orientation
    @length = length
  end

  def resultat
    zeros_array = Array.new(length,0)
    if (orientation == true)
      cut_array = word.bits.drop(length)
      return cut_array + zeros_array
    else
      cut_array = word.bits[0..length + 1]
      return zeros_array + cut_array
      end
  end
    
  def animate

    if(orientation == true)
      emph = Emphasis.new(0, length - 1)
      del = Erase.new(0, length - 1)
    else 
      emph = Emphasis.new(word.bits.length - 1 - length, word.bits.lentgh - 1) 
      del = Erase.new(word.bits.length - 1 - length,word.bits.lentgh - 1) 
    end

    return [Move.new(orientation, length), emph, del,Show.new(resultat)]
    
  end

end
    
   
