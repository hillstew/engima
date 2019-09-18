require './lib/enigma'

file = File.open(ARGV[0], "r")
enigma = Enigma.new
hash = enigma.decrypt(file.read.gsub("\n",''), ARGV[2], ARGV[3])

decrypted_file = File.open(ARGV[1], "w")
decrypted_file.write(hash[:decryption])
decrypted_file.close

puts "Created #{ARGV[1]} with the key #{hash[:key]} and date #{hash[:date]}"
