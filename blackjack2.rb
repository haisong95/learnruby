#black Jack

puts "welcome to blackjack!"

suits= ['H','D','S','C']
cards = ['2','3','4','5','6','7','8','9','J','Q','K','A']

deck = suits.product(cards)
deck.shuffle!

mycards = []
dealercards = []

mycards << deck.pop
dealercards << deck.pop
mycards << deck.pop
dealercards << deck.pop

dealertotal = calculate_total(dealercards)
mytotal = calculate_total(mycards)



