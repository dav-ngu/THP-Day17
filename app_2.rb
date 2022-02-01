require 'bundler'
Bundler.require

require_relative 'lib/game'
require_relative 'lib/player'

@player1
@player2
@human
@enemies = []

def welcome
puts "------------------------------------------------"
puts "|Bienvenue sur 'ILS VEULENT TOUS MA POO' !      |"
puts "|Le but du jeu est d'être le dernier survivant !|"
puts "|      COMME à THP :)                           |"
puts "-------------------------------------------------"
end

def create_human_player
    puts "Quel est ton pseudo humain ?"
    print ">"
    return @human = HumanPlayer.new(gets.chomp)
end

def create_comput_user
    @player1 = Player.new("Josiane")
    @player2 = Player.new("José")
    @enemies << @player1
    @enemies << @player2
end

def fight
    while @human.life_points > 0 && (@player1.life_points > 0 || @player1.life_points >0)
      puts "\n"
      puts "Que veux-tu faire ?"
      puts "--- Entre 'a' pour partir à la recherche d'une arme-----------"
        puts "--- Entre 's' pour partir à la recherche  d'un pack de soin---"
        puts "--- Entre '0' pour attaquer Josiane --------------------------"
        puts "--- Entre '1' pour attaquer José -----------------------------"
      print "> "
      action = gets.chomp.to_s
      if action == "a" # if 'a' get a weapon
        @human.search_weapon
      elsif action == "s" # if 's' get a health pack
        @human.search_health_pack
      elsif action == "0" # if '0' user attaks 'Josiane'
        @human.attacks (@player1)
      elsif action == "1" # if '1' user attaks 'José'
        @human.attacks (@player2)
    else
        puts "______________ Tu as pas entré la bonne valeur _______________"
        puts "--- Entre 'a' pour partir à la recherche d'une arme-----------"
        puts "--- Entre 's' pour partir à la recherche  d'un pack de soin---"
        puts "--- Entre '0' pour attaquer Josiane --------------------------"
        puts "--- Entre '1' pour attaquer José -----------------------------"
    end

    if @human.life_points > 0 && (@player1.life_points > 0 || @player1.life_points >0)
        puts "Les autres joueurs t'attaquent !"
        @enemies.each { |i| i.life_points <= 0 ? break : i.attacks(@human) }
        @human.show_state
    else
        puts "Il n'y a plus de players en etat de combattre."
    end
    end
   
    if @player1.life_points == 0 && @player2.life_points == 0 
    puts "La partie est finie"
end
end

def perform
  welcome
  create_human_player
  create_comput_user
  fight
end

perform