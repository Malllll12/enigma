require "./lib/keys"
require "./lib/offset"
require "./lib/encrypt"
require "./lib/decrypt"

class Enigma

  def encrypt(message, key = nil, date = nil)
    encryptor = Encrypt.new(message, key, date)
    encryptor.start
  end

  def decrypt(message, key, date = nil)
    decryptor = Decrypt.new(message, key, date)
    decryptor.decrypt_start
  end
end
