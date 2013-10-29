puts "Please enter the word you want to sort"

a = []

while true
  words = gets.chomp
  break if words == ' '
 
a << words

end


puts a.sort!
