class Deck
  SUITS = ["\u2665", "\u2666", "\u2663", "\u2660"]
  FACES = [2, 3, 4, 5, 6, 7, 8, 9, 10, 'A', 'K', 'Q', 'J']

  def initialize
    @deck = Array.new(self.class.deck)
    @deck.shuffle!
  end

  def take_card
    @deck.pop
  end

  def self.deck
    @deck ||= SUITS.map do |suit|
      FACES.map { |face| Card.new(face, suit) }
    end.flatten
  end
end