require_relative 'models/game_interface'
require_relative 'models/game_controller'
require_relative 'models/user'
require_relative 'models/hand'
require_relative 'models/deck'
require_relative 'models/card'

begin
  puts "Введите ваше имя"
  name = gets.chomp
  player = User.new(name)
rescue Exception => e
  puts e.message
  retry
end

puts "Добро пожаловать, #{player.name}. Начнем игру!"
dealer = User.new('dealer')

game = GameController.new(player, dealer)
interface = GameInterface.new

loop do
  break unless interface.can_play?(player, dealer)
  interface.bank_info(player, dealer)
  
  game.give_cards
  interface.print_info(game)
  game.bet
  
  player_move = interface.player_move
  if player_move == 1
    game.dealer_move
  elsif player_move == 2
    game.player_move
    game.dealer_move
  end
  
  interface.print_info(game, true)
  result = game.result
  
  if result == 0
    interface.draw
  elsif result == 1
    interface.player_win
  else
    interface.dealer_win
  end
  
  game.fold
  
  puts 'Играем дальше? (y - да, n - нет)'
  choice = gets.chomp
  break unless choice == 'y'
end
