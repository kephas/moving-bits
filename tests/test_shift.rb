$LOAD_PATH << '..'
require "word"
require "shift"
require "test/unit"

class Shift_test < Test::Unit::TestCase
  def test_exemple_lambda_gauche
    mot_lambda = Word.new(1,0,0,1,0,1,0,0,0,1)
    shift_lambda = Shift.new(mot_lambda, true, 4)
    assert_equal(shift_lambda.resultat,[0,1,0,0,0,1,0,0,0,0])
  end
  def test_exemple_lambda_droite
    mot_lambda = Word.new(1,0,0,1,0,1,0,0,0,1)
    shift_lambda = Shift.new(mot_lambda, false, 4)
    assert_equal(shift_lambda.resultat,[0,0,0,0,1,0,0,1,0,1])
  end
  def test_decalage_plus_long_que_mot
    mot_test = Word.new(1,0,1,0,1)
    resultat_calcule = Shift.new(mot_test, true, 8)
    assert_equal([0,0,0,0,0],resultat_calcule.resultat)
  end
 end 



