require_relative 'cards'

deck = Deck.new
deck.cards.shuffle!

# puts "Welcome to the Blackjack table. Please enter the number of players you have"
# number_of_players = gets.to_i

cards_drawn = deck.cards.pop(2)
puts "PLAYER 1's TURN"
cards_drawn.each {|card| p "#{card.rank} of #{card.suit}"}

total = 0
cards_drawn.each do |card|
  total += RANK_VALUE[card.rank]
end

if total < 21
  if RANK_VALUE[cards_drawn[0].rank] == RANK_VALUE[cards_drawn[1].rank]
    puts "Would you like to hit(h), stay(st) or split(sp)?"
  else
    puts "Would you like to hit(h) or stay(st)?"
  end
  response = gets.chomp
elsif total > 21
  puts "BUST!"
end

if response == "h"
  cards_drawn << deck.cards.pop
  cards_drawn.each {|card| p "#{card.rank} of #{card.suit}"}
end