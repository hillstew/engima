require './lib/shift'

class Decoder
  def initialize(message, key, offset)
    @message = message.downcase.split("")
    @key = key
    @offset = offset.to_s.split("")
    @shift = shift
    @letters = ("a".."z").to_a << " "
    @decoded_message = []
  end

  def shift
    @shift = Shift.new(@key, @offset)
    @shift = @shift.create_shift
  end

  def decode_message
    decoded_message = []
    @message.each_index do |i|
      if !@letters.include?(@message[i])
        decoded_message.push(@message[i])
      else
        index = @letters.index(@message[i])
        rotated = nil
        if i.modulo(4) == 0
          rotated = @letters.rotate(-@shift["A"])
        elsif i.modulo(4) == 1
          rotated = @letters.rotate(-@shift["B"])
        elsif i.modulo(4) == 2
          rotated = @letters.rotate(-@shift["C"])
        elsif i.modulo(4) == 3
          rotated = @letters.rotate(-@shift["D"])
        end

        if rotated == nil
          decoded_message << @message[i]
        else
          decoded_message << rotated[index]
        end
      end
    end
    decoded_message.join
  end
end
