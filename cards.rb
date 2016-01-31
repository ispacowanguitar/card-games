class Card
  attr_accessor :rank, :suit

  def initialize(rank, suit)
    @rank = rank
    @suit = suit
  end
end

class Deck
  RANKS = %w(1 2 3 4 5 6 7 8 9 J Q K A)
  SUITS = %w(spade heart club diamond)

  attr_accessor :cards

  def initialize
    @cards = []
    RANKS.each do |rank|
      SUITS.each do |suit|
        @cards << Card.new(rank, suit)
      end
    end
  end
end

deck = Deck.new

deck.cards.each do |card|
  puts "#{card.rank} #{card.suit}"
end

random_card = deck.cards[rand(deck.cards.length - 1)]
p "RANDOM CARD: #{random_card.rank} #{random_card.suit}"
