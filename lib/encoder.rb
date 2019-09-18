require './lib/shift'

class Encoder
  def initialize(message, key, offset)
    @message = message.downcase.split("")
    @offset = offset.to_s.split("")
    @key = key
    @shift = shift
    @letters = ("a".."z").to_a << " "
  end

  def shift
    Shift.new(@key, @offset).create_shift
  end

  def encode_message
    encoded_message = []
    @message.each_index do |i|
      if !@letters.include?(@message[i])
        encoded_message.push(@message[i])
      else
        index = @letters.index(@message[i])
        rotated = nil
        if i.modulo(4) == 0
          rotated = @letters.rotate(@shift["A"])
        elsif i.modulo(4) == 1
          rotated = @letters.rotate(@shift["B"])
        elsif i.modulo(4) == 2
          rotated = @letters.rotate(@shift["C"])
        elsif i.modulo(4) == 3
          rotated = @letters.rotate(@shift["D"])
        end

        if rotated == nil
          encoded_message << @message[i]
        else
          encoded_message << rotated[index]
        end
      end
    end
    encoded_message.join
  end
end
