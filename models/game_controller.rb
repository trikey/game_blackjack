class GameController

  BET_SIZE = 10

  def initialize(player, dealer)
    @player = player
    @dealer = dealer
    @deck = Deck.new
    @player_hand = Hand.new
    @dealer_hand = Hand.new
  end

  def start_game
    give_cards
    print_info
    @player.bet(BET_SIZE)
    @dealer.bet(BET_SIZE)
    player_move
    @player_hand.fold
    @dealer_hand.fold
  end

  def print_info(show_diler_points = false)
    puts "Ваши карты: #{@player_hand.cards(:visible)}, #{@player_hand.points} очков"
    puts "Карты дилера: #{@dealer_hand.cards(show_diler_points)}, #{show_diler_points ? @dealer_hand.points : '*'} очков"
  end
  
  def give_cards
    2.times do
      @player_hand.take_card(@deck.take_card)
      @dealer_hand.take_card(@deck.take_card)
    end
  end
  
  def player_move
    puts 'Ваш ход:'
    puts '1. Пропустить ход'
    puts '2. Добавить карту'
    puts '3. Открыть карты'
    loop do
      choice = gets.chomp.to_i
      case choice
      when 1
        dealer_move
        break
      when 2
        @player_hand.take_card(@deck.take_card)
        dealer_move
        break
      when 3
        break
      else
        puts 'Ошибка ввода. Попробуйте еще раз:'
      end
    end
    result
  end
  
  def dealer_move
    @dealer_hand.take_card(@deck.take_card) if @dealer_hand.points < 18
  end
  
  def result
    print_info(true)
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
    puts 'Ничья.'
    @player.gain(BET_SIZE)
    @dealer.gain(BET_SIZE)
  end
  
  def player_win
    puts 'Вы выиграли!'
    @player.gain(BET_SIZE * 2)
  end

  def dealer_win
    puts 'Вы проиграли.'
    @dealer.gain(BET_SIZE * 2)
  end
  
end