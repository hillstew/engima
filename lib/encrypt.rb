require './lib/enigma'

file = File.open(ARGV[0], "r")
enigma = Enigma.new
hash = enigma.encrypt(file.read.gsub("\n",''))

encrypted_file = File.open(ARGV[1], "w")
encrypted_file.write(hash[:encryption])
encrypted_file.close

puts "Created #{ARGV[1]} with the key #{hash[:key]} and date #{hash[:date]}"
