require 'date'
require 'securerandom'
require './lib/encoder'
require './lib/decoder'

class Enigma
  def get_key
    SecureRandom.random_number(99999)
  end

  def offset(date)
    (date.to_i * date.to_i).to_s[-4..-1].to_i
  end

  def get_date
    DateTime.now.strftime "%d%m%y"
  end

  def encrypt(message, key = get_key, date = get_date)
    offset = offset(date)
    encoder = Encoder.new(message, key.to_s, offset)
    {encryption: encoder.encode_message, key: key, date: date }
  end

  def decrypt(message, key = get_key, date = get_date)
    offset = offset(date)
    decoder = Decoder.new(message, key, offset)
    {decryption: decoder.decode_message, key: key.to_s, date: date }
  end
end
