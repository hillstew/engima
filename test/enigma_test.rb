require './test/test_helper'

class EnigmaTest < Minitest::Test
  def setup
    @enigma = Enigma.new
  end

  def test_it_exists
    assert_instance_of Enigma, @enigma
  end

  def test_it_can_encrpyt
    actual = @enigma.encrypt("hello world", "02715", "040895")
    expected =  {
      encryption: "keder ohulw",
      key: "02715",
      date: "040895"
    }
    assert_equal expected, actual
  end

  def test_it_can_decrpyt
    actual = @enigma.decrypt("keder ohulw", "02715", "040895")
    expected = {
      decryption: "hello world",
      key: "02715",
      date: "040895"
    }
    assert_equal expected, actual
  end

  def test_it_can_encrypt_with_no_date
    # TODO: use mock date
    actual = @enigma.encrypt("hello world", "02715")
    expected = {
      encryption: "njhauesdxq ",
      key: "02715",
      date: DateTime.now.strftime("%d%m%y")
    }
    assert_equal expected, actual
  end

  def test_it_can_decrypt_with_special_chars
    actual = @enigma.decrypt("krfq!qbbdf...?", "63900", "170919")
    expected = {
      decryption: "yarp! narp...?",
      key: "63900",
      date: "170919"
    }
    assert_equal expected, actual
  end

  def test_it_can_encrypt_with_special_chars
    actual = @enigma.encrypt("krfq!qbbdf...?", "63900", "170919")
    expected = {
      encryption: "xhur!gqcqw...?",
      key: "63900",
      date: "170919"
    }
    assert_equal expected, actual
  end

  def test_it_can_encrypt_with_no_date_or_key
    # TODO: use mock date
    skip
    actual = @enigma.encrypt("hello world")
    expected = {
      encryption: "",
      key: "",
      date: DateTime.now.strftime("%d%m%y")
    }
    assert_equal expected, actual
  end
end
