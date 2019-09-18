require './test/test_helper'
require './lib/shift'

class ShiftTest < Minitest::Test
  def setup
    @key = 45638
    @offset = "2345"
    @enigma = Enigma.new
    @shift = Shift.new(@key, @offset)
  end

  def test_it_exists
    assert_instance_of Shift, @shift
  end

  def test_it_can_create_a_shift_hash
    actual = @shift.create_shift
    expected = {
      "A" => @shift.shift_a,
      "B" => @shift.shift_b,
      "C" => @shift.shift_c,
      "D" => @shift.shift_d
    }
    assert_equal expected, actual
  end
end
