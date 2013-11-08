class Card
	attr_accessor :suit, :face_value
  def initialize(s,v)
  	@suit = s
  	@face_value = v
  end

  def find_suit
  	ret_val = case suit
  		          when 'H' then 'Hearts'
  		          when 'D' then 'Diamond'
  		          when 'S' then 'Space'
  		          when 'C' then 'Club'
  		        end
  	ret_val
  end

  def pretty_output
  	"The #{face_value} of #{find_suit}"
  end

  def to_s
  	pretty_output
  end
end


class Deck
	attr_accessor :cards
	def initialize
		@cards = []
		['H','D','S','C'].each do |suit|
		['2','3','4','5','6','7','8','9','J','Q','K','A'].each do |value|

			@cards << Card.new(suit,value)
		  end
	  end
	scramble!
  end

  def scramble!
  	cards.shuffle!
  end

  def deal_one_card
  	cards.pop
  end

  def size
  	cards.size
  end
end

module Hand
	def show_hand
		puts "---- #{name}'s hand----"
		cards.each do |card|
			puts "#{card}"
		end
		puts "=> Total: #{total}"
	end

	def add_card(new_card)
		cards << new_card
	end

	def total
		face_value = cards.map {|card| card.face_value}
		total = 0
		face_value.each do |val|
			if val == "A"
				total += 11
			else
				total += (val.to_i == 0 ? 10 : val.to_i)
			end
		end
    
    face_value.select{|val| val == 'A'}.count.times do
    	break if total <= 21
    	total -= 10
    end
    total
  end

class Player
	include Hand

	attr_accessor :name, :cards

  def initialize (n)
  @name = n
  @cards = []
  end
  
end

class Dealer
  include Hand

  attr_accessor :name, :cards

  def initialize
    @name = "Dealer"
    @cards = []
  end
end

class Blackjack
    attr_accessor :deck, :player, :dealer
    def initialize
      @deck = Deck.new
      @player = Player.new('player1')
      @dealer = Dealer.new
    end  
    
    def set_names
      puts "------What's your name?-----"
      player.name = gets.chomp
    end


    def deal_cards
      player.add_card(deck.deal_one_card)
      player.add_card(deck.deal_one_card)
      dealer.add_card(deck.deal_one_card)
      dealer.add_card(deck.deal_one_card)
    end

    def show_hands
      player.show_hand
      dealer.show_hand
    end

    def start
      set_names
      deal_cards
      show_hands
    end
  end

game = Blackjack.new
game.start


end