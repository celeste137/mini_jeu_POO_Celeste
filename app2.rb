require 'bundler'
Bundler.require

require_relative 'lib/game'
require_relative 'lib/player'

puts "----------------------------------"
puts "|         Bienvenue sur          |"
puts "|   -ILS VEULENT TOUS MA POO !-  |"
puts "|                                |"
puts "| Sois le dernier joueur en lice |"
puts "----------------------------------\n\n"

print "Donne un prénom à ton personnage : "
player_name = gets.chomp
player1 = HumanPlayer.new(player_name)
array_bots = [bot1 = Player.new("Gordon"), bot2 = Player.new("Ramsay")]

while player1.life_points > 0 && !array_bots.select{|bot| bot.life_points > 0}.empty?

puts player1.show_state
puts "Quelle action veux-tu effectuer ?\n\n"
puts "a - Chercher une meilleure arme"
puts "s - Chercher à se soigner\n\n"
puts " Attaquer un joueur en vue :"
array_bots.each_with_index do |bot,index|
  puts "#{index} : #{bot.show_state}"
end
choice = gets.chomp
case choice
when "a"
  player1.search_weapon
when "s"
  player1.search_health_pack
when "0"
  player1.attacks(bot1)
when "1"
  player1.attacks(bot2)
else
  puts "Mauvaise entrée"
end
puts "\nLes autres joueurs t'attaquent !"
array_bots.select{|bot| bot.life_points > 0}.each do |bot| bot.attacks(player1) end
end

puts "------ Game over ------"
if player1.life_points > 0
  puts "  BRAVO ! TU AS GAGNE !"
else
  puts "      YOU LOSE."
end
