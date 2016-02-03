require_relative 'cards'

deck = Deck.new
deck.cards.shuffle!

# puts "Welcome to the Blackjack table. Please enter the number of players you have"
# number_of_players = gets.to_i

cards_drawn = deck.cards.pop(2)
puts "PLAYER 1's TURN"
cards_drawn.each {|card| p "#{card.rank} of #{card.suit}"}

def sum(cards_drawn)
  total = 0
  cards_drawn.each do |card|
    total += RANK_VALUE[card.rank]
  end
  total
end

total = 0
total = sum(cards_drawn)
response = ""
until total >= 21 || response == "st"


  if total < 21
    if RANK_VALUE[cards_drawn[cards_drawn.length - 2].rank] == RANK_VALUE[cards_drawn[cards_drawn.length - 1].rank]
      puts "Would you like to hit(h), stay(st) or split(sp)?"
    else
      puts "Would you like to hit(h) or stay(st)?"
    end
    response = gets.chomp
    if response == "h"
      cards_drawn << deck.cards.pop
      cards_drawn.each {|card| p "#{card.rank} of #{card.suit}"}
      total = sum(cards_drawn)
    elsif response == "st"
      puts "your total score is #{total}"
    end
  end
end

if total > 21
  puts "BUST! #{sum(cards_drawn)}"
elsif total == 21
  puts "NAILED IT!"
end

