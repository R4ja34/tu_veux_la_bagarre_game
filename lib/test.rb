require_relative "player.rb"


player1 = Player.new("raja", 20)
player2 = Player.new("haingo", 20)
player0 = HumanPlayer.new("raja", 20)


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

# Imprimez 1 à 100 pour cent en place dans la console en utilisant la technique de "sortie dynamique"
# Print 1 to 100 percent in place in the console using "dynamic output" technique
1.upto(100) do |i|
  printf("\rPercentage: %d%", i)
  sleep(0.1)
end

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



Elle va commencer par lancer un "dé" dont le résultat sera compris entre 1 et 6 (tu sais faire ça maintenant non?).
Ce lancé de dé sera égal au niveau de la nouvelle arme trouvée. Annonce le résultat de la recherche à l'utilisateur en affichant un message du genre "Tu as trouvé une arme de niveau XXX".
Maintenant, cherche à savoir si ça vaut le coup pour le joueur Human Player de la garder… Utilise un if pour comparer le niveau de cette nouvelle arme avec celle qu'il possède déjà (@weapon_level).
Si l'arme trouvée est d'un niveau strictement supérieur, il la garde. Son @weapon_level prend alors la valeur de la nouvelle arme et tu affiches un message du genre "Youhou ! elle est meilleure que ton arme actuelle : tu la prends."
Si l'arme trouvée est égale ou moins bien que son arme actuelle, tu ne changes rien et ne fais qu'afficher un petit "M@*#$... elle n'est pas mieux que ton arme actuelle..."
