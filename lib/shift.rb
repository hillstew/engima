class Shift
  def initialize(key, offset)
    @key = key.to_s.split("")
    @offset = offset
    @shift_hash = Hash.new
  end

  def create_shift
    @shift_hash = {
      "A" => shift_a,
      "B" => shift_b,
      "C" => shift_c,
      "D" => shift_d
    }
  end

  def shift_a
    (@key[0] + @key[1]).to_i + @offset[0].to_i
  end

  def shift_b
    (@key[1] + @key[2]).to_i + @offset[1].to_i
  end

  def shift_c
    (@key[2] + @key[3]).to_i + @offset[2].to_i
  end

  def shift_d
    (@key[3] + @key[4]).to_i + @offset[3].to_i
  end
end
