require 'test/unit'
require_relative '../lib/input_validator'

class InputValidatorTest < Test::Unit::TestCase
  def call_service(floor_area, square_meters = '1,3')
    InputValidator.new(floor_area, square_meters).call
  end

  def test_valid_inputs
    result = call_service('5x5', '1,2')
    assert(result.success?)
  end

  def test_invalid_floor_area
    result = call_service('5x5d')
    assert(!result.success?)
    assert_equal('Invalid floor area input: 5x5d', result.error)
  end

  def test_invalid_square_meter1
    result = call_service('5x5', '1,3d')
    assert(!result.success?)
    assert_equal('Invalid square-meter input: 1,3d', result.error)
  end

  def test_invalid_square_meter2
    result = call_service('5x5', '1,10')
    assert(!result.success?)
    assert_equal('Provided square-meter to clean (1,10) is outiside the given floor area', result.error)
  end
end
