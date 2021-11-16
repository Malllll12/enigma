require './lib/enigma'
require "./lib/keys"
require "./lib/offset"
keys = Keys.new
date = Offset.new
enigma = Enigma.new

file = File.open(ARGV[0],"r")
secret = file.read
file.close


secret_revealed = enigma.decrypt(secret, ARGV[2], ARGV[3])
creator = File.open(ARGV[1],"w")
creator.write(secret_revealed[:decryption])
puts "Created '#{ARGV[1]}' with the key #{secret_revealed[:keys]} and date #{secret_revealed[:date]}"
