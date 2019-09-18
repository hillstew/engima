require './test/test_helper'
require './lib/encoder'
require './lib/shift'

class EncoderTest < Minitest::Test
  def setup
    @key = "02715"
    @offset = "1025"
    @encoder = Encoder.new("hello world", @key, @offset)
    @shift = Shift.new(@key, @offset)
  end

  def test_it_exists
    assert_instance_of Encoder, @encoder
  end

  def test_shift_returns_hash
    actual = @encoder.shift
    expected = {
        "A" => 3,
        "B" => 27,
        "C" => 73,
        "D" => 20
    }
    assert_equal expected, actual
  end

  def test_it_can_encode_message
    actual = @encoder.encode_message
    expected = "keder ohulw"
    assert_equal expected, actual
  end
end
