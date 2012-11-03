class Wand
    attr_accessor :word1, :word2, :result, :steps
    def initialize(word1, word2)
        @word1 = word1
        @word2 = word2
        @result = self.calcresult
        @animate = self.calcanimate
    end

    def calcresult
        tmptab = []
        i = 0

        unless (word1.bits[i] == nil) || (word2.bits[i] == nil)
            if word1.bits[i] == word2.bits[i]
                if word1.bits[i] == 1
                    tmptab.push(1)
                end
            else
                tmptab.push(0)
            end
            i += 1
        end

        return tmptab
    end

    def calcanimate
        return [Show.new(word1), Show.new(word2), Show.new(@result)]
    end
end

class Wor
    attr_accessor :word1, :word2, :result, :steps
    def initialize(word1, word2)
        @word1 = word1
        @word2 = word2
        @result = self.calcresult
        @animate = self.calcanimate
    end

    def calcresult
        tmptab = []
        i = 0

        unless (word1.bits[i] == nil) || (word2.bits[i] == nil)
            if (word1.bits[i] == 1) || (word2.bits[i] == 1)
                tmptab.push(1)
            else
                tmptab.push(0)
            end
            i += 1
        end
    
        return @tmptab
    end

    def calcanimate
        return [Show.new(word1), Show.new(word2), Show.new(@result)]
    end
end
