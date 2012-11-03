class wand
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

        unless (word1[i] == nil) || (word2[i] == nil)
            if word1[i] == word2[i]
                if word[i] == 1
                    tmptab.puts(1)
                end
            else
                tmptab.puts(0)
            end
            i += 1
        end

        return @tmptab
    end

    def calcanimate
        return [Show.new(word1), Show.new(word2), Show.new(@result)]
    end
end

class wor
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

        unless (word1[i] == nil) || (word2[i] == nil)
            if (word1[i] == 1) || (word2[i] == 1)
                tmptab.puts(1)
            else
                tmptab.puts(0)
            end
            i += 1
        end
    
        return @tmptab
    end

    def calcanimate
        return [Show.new(word1), Show.new(word2), Show.new(@result)]
    end
end
