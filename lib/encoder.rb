require './lib/enigma'
require "./lib/keys"
require "./lib/offset"
keys = Keys.new
date = Offset.new
enigma = Enigma.new

file = File.open(ARGV[0],"r")
message = file.read
file.close

result = enigma.encrypt(message)
creator = File.open(ARGV[1],"w")
creator.write(result[:encryption])
puts "Created '#{ARGV[1]}' with the key #{result[:keys]} and date #{result[:date]}"
