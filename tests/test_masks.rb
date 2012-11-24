$LOAD_PATH << ".."
require "test/unit"
require "commands"
require "word"
require "masks"

class Wand_test
  def test_normal
    word1 = Word.new([1,0,0,1,1,1])
    word2 = Word.new([1,1,0,0,0,1])
    calculated_result = Wand.new(word1,word2).result
    expected_result = [1,0,0,0,0,1]
    assert_equal(expected_result, calculated_result)
  end
end
   
