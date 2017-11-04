class GameController

  BET_SIZE = 10
  attr_reader :player_hand, :dealer_hand, :player, :dealer

  def initialize(player, dealer)
    @player = player
    @dealer = dealer
    @deck = Deck.new
    @player_hand = Hand.new
    @dealer_hand = Hand.new
  end
  
  def give_cards
    2.times do
      @player_hand.take_card(@deck.take_card)
      @dealer_hand.take_card(@deck.take_card)
    end
  end
  
  def fold
    @player_hand.fold
    @dealer_hand.fold
  end
  
  def bet
    @player.bet(BET_SIZE)
    @dealer.bet(BET_SIZE)
  end
  
  def player_move
    @player_hand.take_card(@deck.take_card)
  end
  
  def dealer_move
    @dealer_hand.take_card(@deck.take_card) if @dealer_hand.points < 18
  end
  
  def result
    player_points = @player_hand.points
    dealer_points = @dealer_hand.points
    if player_points == dealer_points
      draw
    elsif player_points == 21
      player_win
    elsif dealer_points == 21
      dealer_win
    elsif player_points < 21 && dealer_points < 21
      player_points > dealer_points ? player_win : dealer_win
    else
      player_points > dealer_points ? dealer_win : player_win
    end
  end

  def draw
    @player.gain(BET_SIZE)
    @dealer.gain(BET_SIZE)
    0
  end
  
  def player_win
    @player.gain(BET_SIZE * 2)
    1
  end

  def dealer_win
    @dealer.gain(BET_SIZE * 2)
    -1
  end
  
end