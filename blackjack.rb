puts "what's your name?"
name = gets.chomp
puts "welcome to BlackJack game!"

while true
	card = rand(14)
      
    if card > 10
       card == 10
    end
    puts "you have #{card} points!" 
    puts "do you want to hit or stay?"

    decision = gets.chomp
    if decision = 'hit'
	   card2 = rand(14)
	   if card2 > 10
	   	  card2 == 10
       end

       total_num = card + card2
       
       if total_num > 21
       	puts "you are lost!"
       	break
       end

       




