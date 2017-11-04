class GameInterface
  def print_info(game, show_diler_points = false)
    puts "Ваши карты: #{game.player_hand.cards(:visible)}, #{game.player_hand.points} очков"
    puts "Карты дилера: #{game.dealer_hand.cards(show_diler_points)}, #{show_diler_points ? game.dealer_hand.points : '*'} очков"
  end
  
  def draw
    puts 'Ничья.'
  end
  
  def player_win
    puts 'Вы выиграли!'
  end
  
  def dealer_win
    puts 'Вы проиграли.'
  end  
  
  def player_move
    puts 'Ваш ход:'
    puts '1. Пропустить ход'
    puts '2. Добавить карту'
    puts '3. Открыть карты'
    choice = 1
    loop do
      choice = gets.chomp.to_i
      break if [1, 2, 3].include? choice
      puts 'Ошибка ввода. Попробуйте еще раз:'
    end
    choice
  end
  
  def bank_info(player, dealer)
    puts "У вас в банке #{player.bank}, у дилера в банке #{dealer.bank}"
  end
  
  def can_play?(player, dealer)
    if player.bank.zero?
      puts 'У вас не осталось денег'
      return false
    elsif dealer.bank.zero?
      puts 'У дилера не осталось денег'
      return false
    end
    true
  end
end