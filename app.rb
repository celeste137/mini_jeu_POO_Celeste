require 'bundler'
Bundler.require

require_relative 'lib/game'
require_relative 'lib/player'

player1 = Player.new("Gordon")
player2 = Player.new("Ramsay")

while player1.life_points > 0 and player2.life_points >0
    puts "\nVoici l'état de chaque joueur : "
  puts player1.show_state
  puts player2.show_state
  puts "\nPassons à la phase d'attaque :"
  player1.attacks(player2)
  if player2.life_points <= 0
    break
  end
  player2.attacks(player1)
end

#binding.pry