# masks.rb
# And and Or masks for words
#
# If the two words given to the "and" and "or" masks are not of the same size,
# the masks operate as if several zeros were concatenated to the smallest word
# in order to match the bigger word's size.
# Thus, since (0 && x) = 0 and (0 || x) = x, the remainder of the result is
# filled with zeros in the "and" mask and filled with the values of the bigger
# word in the "or" mask.

# Required files
require './word'
require './commands'

# Class for the "and" mask
class Wand
    attr_accessor :word1, :word2, :result, :animate
    def initialize(word1, word2)
        @word1 = word1
        @word2 = word2
        @result = self.calcresult
        @animate = self.calcanimate
    end

    # Calculation of the result
    def calcresult
        tmptab = []
        i = 0

        until ((word1.bits[i] == nil) || (word2.bits[i] == nil))
            if (word1.bits[i] == word2.bits[i])
                if (word1.bits[i] == 1)
                    tmptab.push(1)
                else
                    tmptab.push(0)
                end
            else
                tmptab.push(0)
            end
            i += 1
        end
        
        # Checking whether the words are not of the same size
        if (word1.bits[i] == nil)
            until (word2.bits[i] == nil)
                tmptab.push(0)
                i += 1
            end
        else
            until (word1.bits[i] == nil)
                tmptab.push(0)
                i += 1
            end
        end

        return tmptab
    end

    def calcanimate
        return [Show.new(word1, "&&", word2), Show.new(@result)]
    end
end

# Class for the "or" mask
class Wor
    attr_accessor :word1, :word2, :result, :animate
    def initialize(word1, word2)
        @word1 = word1
        @word2 = word2
        @result = self.calcresult
        @animate = self.calcanimate
    end

    # Calculation of the result
    def calcresult
        tmptab = []
        i = 0

        until ((word1.bits[i] == nil) || (word2.bits[i] == nil))
            if ((word1.bits[i] == 1) || (word2.bits[i] == 1))
                tmptab.push(1)
            else
                tmptab.push(0)
            end
            i += 1
        end

        # Checking if one of the words are not of the same size
        if (word1.bits[i] == nil)
            until (word2.bits[i] == nil)
                tmptab.push(word2.bits[i])
                i += 1
            end
        else
            until (word1.bits[i] == nil)
                tmptab.push(word1.bits[i])
                i += 1
            end
        end

        return tmptab
    end

    def calcanimate
        return [Show.new(word1, "||", word2), Show.new(@result)]
    end
end
