require 'pry'

class Player
  attr_accessor :name, :health
  @@all_users = []

  def initialize(name, health=10)
    @name = name
    @health = health
    @@all_users << self
  end
##########################################################
#           CLASS METHOD
##########################################################

  def self.all # pourquoi self.all peut etre methode de classe
    @@all_users
  end

##########################################################
#           OBJECT METHOD
##########################################################
  
  def show_status
    puts "#{@name} a #{@health}point de vie"
  end

  def hit
    return rand(1..10)
  end

  def hit_someone(player)
    hit = hit()
    player.health -= hit
    puts "#{@name} attaque et inflige #{hit} point de vie a #{player.name}"
    if player.health <= 0
      player.health = 0
      return player.health
    end
  end

  def death
    if @health == 0
      puts "#{@name} est mort"
      return true
    else
      return false
    end
  end
end

class HumanPlayer < Player
  attr_accessor :weapon_level

  def initialize(name, health = 100, weapon_level = 1)
    @weapon_level = weapon_level
    super(name, health)
  end

  def show_status
    puts "#{@name} a #{@health} point de vie et une arme de niveau #{@weapon_level}"
  end

  def hit
    return rand(1..10) * @weapon_level
  end


  def get_new_weapon
    new_weapon = rand(1..10)
    puts "vous avais trouvais une arme de niveau #{new_weapon}"
    choice_weapon = ""
    while !(choice_weapon == "y" or choice_weapon == "n")
      print "voulais vous garder l'arme y/n :"
      choice_weapon = gets.chomp
      if choice_weapon == "y"
        @weapon_level = new_weapon
        puts "vous avais une arme de niveau #{new_weapon}"
      elsif choice_weapon =="n"
        puts "vous avais decidé de garder votre arme"
      else
        puts "entrer un choix valide"
      end
    end
  end

  def get_health
    health_point = [0, 25, 25, 25, 25, 25, 50, 50, 50, 50][rand(9)]
    @health += health_point
    if @health > 100
      @health = 100
      puts "niveau de vie max"
    else
    puts "#{@name} a gagné #{health_point} point vie"
    puts "#{@name} est a #{@health} point de vie"
    end
  end
end