require_relative "player.rb"


player1 = Player.new("raja", 20)
player2 = Player.new("haingo", 20)



  all_player = Player.all
while true
  player1.show_status
  player1.get_hit_by(player2)
  player1.show_status
  puts " "
  if player1.death
    break
  end
  player2.show_status
  player2.get_hit_by(player1)
  player2.show_status
  puts " "
  if player2.death
    break
  end
end

# all_player.each do 


while true
  puts "Voici l'état des joueurs :"
  player2.show_status
  player1.show_status
  puts " "

  puts 
  puts "#{"-"*10}phase de combat#{"-"*10}"
  player1.get_hit_by(player2)
  if player2.death
    break
  end
  player2.get_hit_by(player1)
  if player2.death
    break
  end
end