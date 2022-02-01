class Player
    attr_accessor :name, :life_points

    def initialize(name)
        @name = name
        @life_points = 10
    end

    def show_state
        puts "#{self.name} a #{self.life_points} points de vie."
    end         #possible de mettre @name ou @life-points.

    def gets_damage(points)
        @life_points = @life_points - points
        if @life_points <= 0
            puts "Le joueur #{self.name} a été tué !"
                      #possible de mettre @name  
        end
    end

    def attacks(player)
        puts "#{self.name} attaque #{player.name}."
        damage = compute_damage #on fait appel à la méthode compute_damage
        player.gets_damage(damage) #on inflige les dégats au joueur attaqué
        puts "#{self.name} lui inflige #{damage} point(s) de dommages."
        puts ""
    end

    def compute_damage
        return rand(1..6)
    end
end

class HumanPlayer < Player
    attr_accessor :weapon_level
    
    def initialize(name)
        @weapon_level = 1
        @life_points = 100
    super(name)
    end

    def show_state
        puts "#{self.name} a #{self.life_points} points de vie et une arme de niveau #{@weapon_level}."
    end

    def compute_damage
        rand(1..6) * @weapon_level
    end

    def search_weapon
        new_weapon_level = rand(1..6)
        puts "Tu as trouvé une arme de niveau #{new_weapon_level}."
        if new_weapon_level > weapon_level
            @weapon_level = new_weapon_level
            puts "Youhou ! elle est meilleure que ton arme actuelle : tu la prends."
        else
            
            puts "M@*#$... elle n'est pas mieux que ton arme actuelle..."
        end
    end

    def search_health_pack
        health_loterie = rand(1..6)
        case health_loterie
        when  1
        puts "Tu n'as rien trouvé..."
        when (2..5)
            if @life_points >=50 
                @life_points = 100
            else
              @life_points = @life_points + 50
            end
        puts "Bravo, tu as trouvé un pack de +50 points de vie !"
        when 6
            if @life_points >=20 
                @life_points = 100
            else
            @life_points = @life_points + 80
            end
        puts "Waow, tu as trouvé un pack de +80 points de vie !"
        end
    end
end