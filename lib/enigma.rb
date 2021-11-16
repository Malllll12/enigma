require "./lib/keys"
require "./lib/offset"
require "./lib/encrypt"

class Enigma

  def encrypt(message, key = nil, date = nil)
    encrypt = Encrypt.new(message, key, date)
    encrypt.start
  end
end
