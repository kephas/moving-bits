$LOAD_PATH << '..'

require 'arithmetic'
require 'test/unit'

class Test_Arith < Test::Unit::TestCase
  def test_result
    assert_equal(Add.new(int_to_word(0), int_to_word(0)).result, int_to_word(0))
    assert_equal(Add.new(int_to_word(1), int_to_word(2)).result, int_to_word(3))
    assert_equal(Add.new(int_to_word(4), int_to_word(8)).result, int_to_word(12))
    assert_equal(Add.new(int_to_word(32), int_to_word(32)).result, int_to_word(64))
  end
end
