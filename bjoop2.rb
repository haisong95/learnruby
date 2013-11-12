

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

  def show_flop
    puts "---- #{name}'s hand----"
    puts "#{cards[1]}"
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
  
  def is_busted?
    total > 21
  end
end

  
  def blackjack_or_busted?(player_or_dealer)
    if player_or_dealer.total == 21
      if player_or_dealer.is_a? (Dealer)
        puts "Dealler hit the Blackjack,you lose!"
        play_again?
      else
        puts " you hit the Blackjack, you win!"
        play_again?
      end
    elsif player_or_dealer.is_busted?
      if player_or_dealer.is_a? (Dealer)
        puts "Dealer busted, you win!"
        play_again?
      else
        puts "You busted, Dealer Win!"
        play_again?
      end
    end

      
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
      dealer.show_flop
    end

  
    def player_turn
      blackjack_or_busted?(player)
      while !player.is_busted?
         
      puts "----Do you want to hit or stay?----" 
      response = gets.chomp

         if !['1','2'].include?(response)
          puts "Error, You must enter 1 or 2"
         next
         end
        if response == '2'
          puts "#{player.name} chose to stay!"
          break
        end

        new_card = deck.deal_one_card
        puts "Dealing cards to #{player.name}:#{new_card}" 
        player.add_card(new_card)
        puts "you total is #{player.total}"
        blackjack_or_busted?(player)
      end
    end

    def dealer_turn
      blackjack_or_busted?(dealer)
      while dealer.total < 17
        dealer.add_card(deck.deal_one_card)
        blackjack_or_busted?(dealer)
      end
      puts "dealer stay at #{dealer.total}"
    end
    
    def who_won?
      puts "You total is #{player.total}"
      puts "Dealer's total is #{dealer.total}"
      blackjack_or_busted?
      if player.total > dealer.total
        puts "conguatulations, you win"
      elsif player.total == dealer.total
        puts "sorry,it is a tie"
      else
        puts "sorry, you lose"
      end
    end

    def play_again?
      puts "Do you want to play again? please enter 'y'" 
      response = gets.chomp
      if response != 'y'
        puts "goodbye!"
        exit
      else
        puts "game starting!"
        deck = Deck.new
        player.cards = []
        dealer.cards = []
        start
      end
    end



    def start
      set_names
      deal_cards
      show_hands
      player_turn
      dealer_turn
      who_won?
    end
    end



    
game = Blackjack.new
game.start

