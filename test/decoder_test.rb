require './test/test_helper'

class DecoderTest < Minitest::Test
  def setup
    @key = "02715"
    @offset = "1025"
    @decoder = Decoder.new("keder ohulw", @key, @offset)
    @shift = Shift.new(@key, @offset)
  end

  def test_it_exists
    assert_instance_of Decoder, @decoder
  end

  def test_shift_returns_hash
    actual = @decoder.shift
    expected = {
        "A" => 3,
        "B" => 27,
        "C" => 73,
        "D" => 20
    }
    assert_equal expected, actual
  end

  def test_it_can_decode_message
    actual = @decoder.decode_message
    expected = "hello world"

    assert_equal expected, actual
  end
end
