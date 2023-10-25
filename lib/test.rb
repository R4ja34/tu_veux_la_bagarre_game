require 'pry'
require_relative 'player'


class Game
  attr_accessor :human_player, :bots

  def initialize(human_name, num_bots = 4)
    @human_player = HumanPlayer.new(human_name)
    @bots = []

    num_bots.times do |i|
      @bots << Player.new("bot#{i + 1}")
    end
  end

#################################################################################
#                                   OBJECT METHOD
#################################################################################
  
  def attack_bot
    puts "choix ennemie"
    @bots.each.with_index do |bot, index|
      puts "choix #{index+1} : attaquer #{bot.name} point de vie = #{bot.health}"
    end
    print "vous attaquer : le choix "
    i = gets.chomp.to_i
    while !(1..@bots.length).include?(i)
      print "veuillez entrer choix valide : "
      i = gets.chomp.to_i
    end
    choice_defender = @bots[i-1]
    @human_player.hit_someone(choice_defender)
    if choice_defender.death
      @bots.delete(choice_defender)
    else
      gets.chomp
      choice_defender.show_status
    end
  end

  def human_player_choice(choice)
    while !(choice == 1 or choice == 2 or choice == 3)
      gets.chomp
      puts "-----------------------"
      puts " au tour de #{@human_player.name}"
      puts "-----------------------"
      puts "1-attaquer"
      puts "2-se soigner"
      puts "3-chercher une arme"
      print "choix action : "
      choice = gets.chomp.to_i
  
      case choice
      when 1
        attack_bot()
      when 2
        puts " "
        get_health()
      when 3
        puts " "
        get_new_weapon()
      else 
        print "choix incorrecte entrer bonne valeur : "
      end
    end
  end
end

