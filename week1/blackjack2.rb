#black Jack

puts "welcome to blackjack!"

suits= ['H','D','S','C']
cards = ['2','3','4','5','6','7','8','9','J','Q','K','A']

deck = suits.product(cards)
deck.shuffle!

mycards = []
dealercards = []

def calculate_total cards
	arr = cards.map{|e| e[1]}

	total = 0
	arr.each do |value|
		if value == "A"
			 total += 11      #Ruby is read descendly. write if in correct order!
			
		elsif value.to_i == 0
			 total += 10
		else
			total += value.to_i
		end
	end

	arr.select{|e| e == "A"}.count.times do
		total -= 10 if total > 21 
	end

	total
end

mycards << deck.pop
dealercards << deck.pop
mycards << deck.pop
dealercards << deck.pop

dealertotal = calculate_total(dealercards)
mytotal = calculate_total(mycards)

puts "You have #{mycards},for a total of #{calculate_total(mycards)}"
puts "Dealer has #{dealercards}, for a total of #{dealertotal}"

while mytotal < 21
	puts "Do you want to hit or stay?"
  
  hit_or_stay = gets.chomp 

	if !['hit','stay'].include?(hit_or_stay)
    puts "You have to make a choice, hit or stay?"
    next
  end

  if hit_or_stay == 'stay'
  	puts "You chose to stay!"
    break
  end
  
  new_card = deck.pop

  puts "Here is the #{new_card}."
  mycards << new_card
  mytotal = calculate_total(mycards)
  puts "you total is #{mytotal}."

  if mytotal == 21
  	puts "You Win! You hit blackjack!"
  	exit
  end

  if mytotal > 21
  	puts "Sorry! You Bust!"
  	exit	
  end
end

while dealertotal < 17
	new_card = deck.pop
	dealercards << new_card
	dealertotal = calculate_total(dealercards)
  
  if dealertotal == 21
  	puts "Sorry, dealer hit the blackjack, you lose!"
  	exit
  end

  if dealertotal > 21
  	puts "Dealer busted! you win!"
  	exit
  end

end

#compare

puts "Dealer's cards: "
dealercards.each do |a|
	puts "+>#{a}"
end

puts "You cards :"
mycards.each do |a|
	puts "+>#{a}"
end

if mytotal > dealertotal
	puts " you total is #{mytotal}, dealertotal is #{dealertotal}"
	puts "you win!"
elsif mytotal < dealertotal
	puts " you total is #{mytotal}, dealertotal is #{dealertotal}"
	puts "you lose!"
else
	puts "you and dealer are same with #{mytotal}"
end


	

























