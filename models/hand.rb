class Hand
  def initialize
    @cards = []
  end
 
  def take_card(card)
    @cards << card
  end
  
  def cards(visible = false)
    card_method = visible ? :to_s : :hidden
    @cards.map(&card_method).join(' ')
  end
  
  def fold
    @cards = []
  end
  
  def points
    points = @cards.inject(0) { |sum, card| sum + card.points(sum) }
  end
end