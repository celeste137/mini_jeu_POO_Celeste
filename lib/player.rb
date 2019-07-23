class Player
  attr_accessor :name, :life_points

  def initialize(name)
    @name = name
    @life_points = 10
  end

  def show_state
    "#{@name} a #{@life_points} points de vie"
  end

  def gets_damage(damages)
    @life_points = @life_points - damages
    if @life_points <= 0
      puts "\nLe joueur #{@name} a été tué ! X__x"
      @life_points = 0
    end
  end

  def attacks(player)
    puts "#{@name} attaque le joueur #{player.name}"
    damages = compute_damage
    puts "Il lui inflige #{damages} point de dégâts.\n\n"
    player.gets_damage(damages)
    check_player_life(player)
  end

  def compute_damage
    return rand(1..6)
  end

  def check_player_life(player)
    if player.life_points > 0
      true
    else
      false
    end
  end                                                             

end



class HumanPlayer < Player #Class HumanPlayer qui hérite de la classe mère Player

  attr_accessor :weapon_level

  def initialize(name)
    super(name)
    @life_points = 100
    @weapon_level = 1
  end

  def show_state
    return "#{@name} a #{@life_points} points de vie et une arme de niveau #{@weapon_level}\n\n"
  end

  def compute_damage
    rand(1..6) * @weapon_level
  end

  def search_weapon
    found_weapon = rand(1..6)
    puts "Tu as trouvé une arme de niveau #{found_weapon}"
    if found_weapon > @weapon_level
      @weapon_level = found_weapon
      puts " Yay ! Elle est meilleure que ton arme actuelle : tu la prends.\n\n"
    else
      puts "Shit. Elle n'est pas mieux que ton arme actuelle...\n\n"
    end
  end

  def search_health_pack
    dice = rand(1..6)
    if dice == 1
      puts "Tu n'as rien trouvé..."
    elsif dice >=2 && dice <= 5
      puts "Bravo ! Tu as trouvé un pack de +50 points de vie !"
      @life_points = @life_points + 50
    elsif dice == 6
      puts "Wow ! Tu as trouvé un pack de +80 points de vie !"
      @life_points = @life_points + 80
    end
    if @life_points > 100
      @life_points = 100
    end
  end

end




