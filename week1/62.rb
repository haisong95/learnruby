line_width = 20

puts "what's the name of chapter 1?"
name1 = gets.chomp
chapter1 = "Chaprter 1: #{name1}"

puts "what's the name of chapter 2? "
name2 = gets.chomp
chapter2 = "Chaprter 2: #{name2}"

puts "what's the name of chapter 3?"
name3 = gets.chomp
Chapter3 = "Chapter 3: #{name3}"

page1 = "page   1"
page2 = "page   9"
page3 = "page   13"

str = "Table of contents"

puts(str.center(line_width))
puts "#{chapter1.ljust( line_width)}  #{page1.rjust(line_width)}"
puts "#{chapter2.ljust( line_width)}  #{page2.rjust(line_width)}"
puts "#{chapter2.ljust( line_width)}   #{page3.rjust(line_width)}"


