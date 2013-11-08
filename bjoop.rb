class Card
	attr_accessor :suit :value
	def initialize(s,v)
		@suit = s
		@value = v
	end

	def to_s
		"This is the card! #{suit},#{value}"
  end
  
end

class Desk
	attr_accessor :cards
	def initialize 
		@cards = []
		['H','D','S','C'].each do |suit|
		['2','3','4','5','6','7','8','9','J','Q','K','A'].each do |value|

			@cards << Card.new(suit,value)

		end
	end

end

def scramble
	cards.shuffle!
end

def deal
	cards.pop
end

def 



class Player
	attr_accessor :name :mycard :mytotal
  def initialize (name)
  	@name = name
  	@mycard = []
    @mytotal = mytotal
  end

  def newcard
  	@mycard << cards.pop
  	@mycard << cards.pop
  puts "you have #{@mycard}"
  
  mycard.calculate_my_card

  if mytotal == 21
  	puts "You hit the Black Jack! You Win!"
  end
  exit
  end


  def calculate_my_card 
	arr = mycard.map{|e| e[1]}

	mytotal = 0
	arr.each do |value|
		if value == "A"
			 mytotal += 11      #Ruby is read descendly. write if in correct order!
			
		elsif value.to_i == 0
			 mytotal += 10
		else
			mytotal += value.to_i
		end
		mytotal
	end

  def hit
  	@mytotal << @cards.pop
  	puts ""
  end

  def stay
  	@mytotal
  	puts "You chose to stay, you have #{@mytotal} points!"
  end










