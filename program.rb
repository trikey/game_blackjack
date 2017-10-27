=begin

User
Dealer
Player
Deck



=end

require_relative 'models/game_controller'
require_relative 'models/user'
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

loop do
  if player.bank.zero?
    puts 'У вас не осталось денег'
    break
  elsif dealer.bank.zero?
    puts 'У дилера не осталось денег'
    break
  end
  puts "У вас в банке #{player.bank}, у дилера в банке #{dealer.bank}"
  game.start_game
  puts 'Играем дальше? (y - да, n - нет)'
  choice = gets.chomp
  break unless choice == 'y'
  
end
