class Decrypt
  attr_reader :message,
              :key,
              :date,
              :character_set
  def initialize(message, key, date)
    @message = message
    @key = Keys.new(key)
    @date  = Offset.new(date)
    @character_set = ("a".."z").to_a << " "
  end

  def shifter
     {
      a_shift: @key.key_shift[0].to_i + @date.offset_shifter[0],
      b_shift: @key.key_shift[1].to_i + @date.offset_shifter[1],
      c_shift: @key.key_shift[2].to_i + @date.offset_shifter[2],
      d_shift: @key.key_shift[3].to_i + @date.offset_shifter[3],
    }
  end

  def decode(message)
    decryptor = []
    message.each_char.with_index do |character, index|
      char_check = @character_set.index(character)
      if @character_set.include?(character)
        shift = (char_check - shifter.values[index % 4] % @character_set.length)
        decryptor << @character_set[shift]
        # require "pry"; binding.pry
      else
        decryptor << character
      end
    end
    decryptor.join
  end

  def decrypt_hash
    {
      decryption: decode(message),
      key: key.key,
      date: date.date
    }
  end

  def decrypt_start
    decode(message)
    decrypt_hash
  end
end
