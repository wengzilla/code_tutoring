class Card
	def initialize(suit, number)
		@suit = suit
		@number = number
	end
	
	def to_s
		"#{@number} of #{@suit}"
	end

	def color
		if @suit == "spades" || @suit == "clubs"
			puts "black"
		elsif @suit == "hearts" || @suit == "diamonds"
			puts "red"
		end
	end

	def value
		if @number == "A"
			puts "1"
		elsif @number == "2"
			puts "2"
		elsif @number == "3"
			puts "3"
		elsif @number == "4"
			puts "4"
		elsif @number == "5"
			puts "5"
		elsif @number == "6"
			puts "6"
		elsif @number == "7"
			puts "7"
		elsif @number == "8"
			puts "8"
		elsif @number == "9"
			puts "9"
		elsif @number == "10" || @number == "J" || @number == "Q" || @number == "K"
			puts "10"
	end

end

class Deck
	def initialize
			@cards = []
			["spades", "hearts", "clubs", "diamonds"].each do |suit|
				["A", "2", "3", "4", "5", "6", "7", "8", "9", "10", "J", "Q", "K"].each do |number|
					@cards << Card.new(number, suit)
			end
		end
	end
 
	def draw(number_of_cards = 1)
			card = @cards.sample(number_of_cards)
			@cards = @cards - card
			card
	end

	def cards
			@cards
	end
end
 
class War_Game
		def initialize(player_one_name, player_two_name, number_of_decks)
				@player_one_name = player_one_name
				@player_two_name = player_two_name
				@shoe = shoe.new(number_of_decks)
				@player_one = Player.new(@deck.draw(26 * number_of_decks).shuffle)
				@player_two = Player.new(@deck.draw(26 * number_of_decks).shuffle)
		end
		
	def play
		while @player_one.cards.count > 0 || @player_two.cards.count > 0
			player_one_card_one = @player_one.draw.value
			player_two_card_one = @player_two.draw.value
			if player_one_card_one.value > player_two_card_one
				player_one.cards << player_two_card_one
			elsif player_two_card_one > player_one_card_one
				player_two.cards << player_one_card_one
			elsif player_one_card_one == player_two_card_one
			War.new.war
			end
		end
		
		if @player_one.cards.count == 0
			puts "#{player_two_name} wins!"
		elsif @player_two.cards.count == 0
			puts "#{player_one_name} wins!"
		end
	end
end

class War
	def initialize
		player_one_card_war_bounty = @player_one.draw(3).value
		player_two_card_war_bounty = @player_two.draw(3).value
		player_one_card_war_decider = @player_one.draw.value
		player_two_card_war_decider = @player_two.draw.value
	end
	
	def war
	if player_one_card_one == player_two_card_one
			if player_one_card_war_decider > player_two_card_war_decider
				player_one.cards << player_two_card_war_decider
				player_one.cards << player_two_card_war_bounty
			elsif player_two_card_war_decider > player_one_card_war_decider
				player_two.cards << player_one_card_war_decider
				player_two.cards << player_one_card_war_bounty
			elsif player_one_card_one == player_two_card_one
			War.new.war
			end
		end
	end
end
 
class Player
		def initialize(cards)
				@cards = cards
		end
end
 
class Shoe
		def initialize(number_of_decks = 1)
				@number_of_decks = number_of_decks
				@cards = []
				number_of_decks.times do
						@cards << Deck.new.cards
				end
				@cards = @cards.flatten
		end
 
		def draw(number_of_cards = 1)
				card = @cards.sample(number_of_cards)
				@cards = @cards - card
				card
		end
end
end