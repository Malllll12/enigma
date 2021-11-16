require './lib/enigma'

enigma = Enigma.new

file = File.open(ARGV[0],"r")
secret = file.read
file.close

secret_revealed = enigma.decrypt(secret, ARGV[2], ARGV[3])
open = File.open(ARGV[1],"w")
open.write(secret_revealed[:decryption])
puts "Created '#{ARGV[1]}' with the key #{secret_revealed[:key]} and date #{secret_revealed[:date]}"
