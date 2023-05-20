require 'test/unit'
require_relative '../lib/command_generator'

class CommandGeneratorTest < Test::Unit::TestCase
  def call_service(inputs)
    CommandGenerator.call(inputs)
  end

  def test_empty_input
    inputs = []
    assert_equal('', call_service(inputs))
  end

  def test_valid_inputs1
    inputs = [[0, 0]]
    assert_equal('C', call_service(inputs))
  end

  def test_valid_inputs2
    inputs = [[0, 1]]
    assert_equal('NC', call_service(inputs))
  end

  def test_valid_inputs3
    inputs = [[1, 0]]
    assert_equal('EC', call_service(inputs))
  end

  def test_valid_inputs4
    inputs = [[0, 1], [4, 1]]
    assert_equal('NCEEEEC', call_service(inputs))
  end

  def test_valid_inputs5
    inputs = [[1, 3], [4, 4]]
    assert_equal('ENNNCEEENC', call_service(inputs))
  end

  def test_valid_inputs6
    inputs = [[2, 2], [4, 4]]
    assert_equal('EENNCEENNC', call_service(inputs))
  end

  def test_valid_inputs7
    inputs = [[4, 0], [0, 4]]
    assert_equal('NNNNCEEEESSSSC', call_service(inputs))
  end

  def test_valid_inputs8
    inputs = [[0, 1], [1, 0]]
    assert_equal('NCESC', call_service(inputs))
  end

  def test_valid_inputs9
    inputs = [[0, 4], [4, 0], [2, 2]]
    assert_equal('NNNNCEESSCEESSC', call_service(inputs))
  end

  def test_valid_inputs10
    inputs = [[4, 0], [1, 1], [0, 4], [2, 3]]
    assert_equal('NNNNCESSSCENNCEESSSC', call_service(inputs))
  end
end
