require 'bundler'
Bundler.require

require_relative 'lib/game'
require_relative 'lib/player'

player1 = Player.new("Josiane")
player2 = Player.new("José")

while player1.life_points >0 && player2.life_points >0
puts "-"*50
puts "Voici l'état de chaque joueur :"
player1.show_state
player2.show_state
puts " "
puts "-"*50

puts "Passons à la phase d'attaque :"
player1.attacks(player2)
  if  player2.life_points > 0
    player2.attacks(player1)
  end
end

puts " "
puts "*"*50
puts player1.life_points > 0 ? 
"#{player1.name} win the battle!" : 
"#{player2.name} win the battle!"
puts "*"*50

binding.pry