require 'bundler'
Bundler.require


require_relative 'lib/player'


puts "---------------------------------------------------"
puts "|                                                  |"
puts "|             welcome in the game                  |"
puts "| Le but du jeu est d'être le dernier survivant !  |"
puts "---------------------------------------------------"

print "quel est ton nom de hero : "
name = gets.chomp
player = HumanPlayer.new(name)

print "combien de bob veut tu affronter max 10 : "
nb_bots = gets.chomp.to_i
bots = []
(1..nb_bots).each do |i|
  bots << Player.new("bob#{i}")
end

# Print 1 to 100 percent in place in the console using "dynamic output" technique
0.step(100, 5) do |i|
  printf("\rProgress: [%-20s]", "=" * (i/5))
  sleep(0.1)
end

puts " "
puts "vous allez commencer le combat contre #{bots.length} bots"

choice_action =""

while !player.death
  while !(choice_action == 1 or choice_action == 2 or choice_action == 3)
    gets.chomp
    puts "-----------------------"
    puts " au tour de #{player.name}"
    puts "-----------------------"
    puts "1-attaquer"
    puts "2-se soigner"
    puts "3-chercher une arme"
    print "choix action : "
    choice_action = gets.chomp.to_i

    case choice_action
    when 1
      puts "choix ennemie"
      bots.each.with_index do |bot, index|
        puts "choix #{index+1} : attaquer #{bot.name} point de vie = #{bot.health}"
      end
      
      print "vous attaquer : le choix "
      i = gets.chomp.to_i
      while !(1..bots.length).include?(i)
        print "veuillez entrer choix valide : "
        i = gets.chomp.to_i
      end
      choice_defender = bots[i-1]
      player.hit_someone(choice_defender)
      if choice_defender.death
        bots.delete(choice_defender)
      else
        gets.chomp
        choice_defender.show_status
        sleep(1)
      end
    when 2
      puts " "
      player.get_health()
    when 3
      puts " "
      player.get_new_weapon
    else 
      print "choix incorrecte entrer bonne valeur : "
    end
  end
  if bots == []
    puts "tout les bots on était mouru"
    puts "#{player.name} a gagné"
    break
  end
  gets.chomp
  puts "-----------------------"
  puts "au tour bots d'attaquer"
  puts "-----------------------"
  bots.each do |bot|
    bot.hit_someone(player)
    sleep(0.2)
  end
  gets.chomp
  player.show_status
  sleep(1)
  choice_action = ""
  # system "clear"
end