class Decrypt
  attr_reader :message,
              :key,
              :date,
              :character_set
  def initialize(message, key, date)
    @message = message
    @key = Keys.new(key)
    @date  = Offset.new
    @character_set = ("a".."z").to_a << " "
  end

  def shifter
    key_offset = {
      a_shift: @key.key_shift[0].to_i + @date.a_offset.to_i,
      b_shift: @key.key_shift[1].to_i + @date.b_offset.to_i,
      c_shift: @key.key_shift[2].to_i + @date.c_offset.to_i,
      d_shift: @key.key_shift[3].to_i + @date.d_offset.to_i,
    }
  end

  def decode(message)
    decryptor = []
    message.each_char.with_index do |character, index|
      x = @character_set.index(character)
      if @character_set.include?(character)
        shift = (x + shifter.values[index % 4] % @character_set.length)
        decryptor << @character_set[shift]
      else
        decryptor << character
      end
    end
    decryptor.join
  end

  # def decrypt_hash
  #   {
  #     encryption: decode(message),
  #     key: key.key,
  #     date: date.date
  #   }
  # end
end
