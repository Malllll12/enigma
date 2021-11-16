require "./lib/keys"
require "./lib/offset"

class Encrypt
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
    key_offset = {
      a_shift: @key.key_shift[0].to_i + @date.offset_shifter[0],
      b_shift: @key.key_shift[1].to_i + @date.offset_shifter[1],
      c_shift: @key.key_shift[2].to_i + @date.offset_shifter[2],
      d_shift: @key.key_shift[3].to_i + @date.offset_shifter[3],
    }
  end

  def encode(message)
    down = @message.downcase
    encryptor = []
    down.each_char.with_index do |character, index|
      x = @character_set.index(character)
      if @character_set.include?(character)
        shift = (x + shifter.values[index % 4] % @character_set.length)
        encryptor << @character_set[shift]
      else
        encryptor << character
      end
    end
    encryptor.join
  end

  def encrypt_hash
    {
      encryption: encode(message),
      key: key.key,
      date: date.date
    }
  end

  def start
    encode(message)
    encrypt_hash
  end
end
