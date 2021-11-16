require './lib/enigma'

enigma = Enigma.new

file = File.open(ARGV[0],"r")
message = file.read
file.close

secret = enigma.encrypt(message)
open = File.open(ARGV[1],"w")
open.write(secret[:encryption])
puts "Created '#{ARGV[1]}' with the key #{secret[:key]} and date #{secret[:date]}"
