class Card
  attr_reader :rank, :suit

  def initialize(rank, suit)
    @rank = rank
    @suit = suit
  end
end

class Deck
  RANKS = %w(2 3 4 5 6 7 8 9 10 J Q K A)
  SUITS = %w(spade heart club diamond)

  attr_reader :cards

  def initialize
    @cards = []
    RANKS.each do |rank|
      SUITS.each do |suit|
        @cards << Card.new(rank, suit)
      end
    end
  end
end

RANKS = %w(2 3 4 5 6 7 8 9 10 J Q K A)
RANK_VALUE = Hash.new
RANKS.each_with_index do |rank, index|
  RANK_VALUE[rank] = index + 2
end
RANK_VALUE["A"] = 1
RANK_VALUE["J"] = 10
RANK_VALUE["Q"] = 10
RANK_VALUE["K"] = 10