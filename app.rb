require 'bundler'
Bundler.require

require_relative 'lib/test'
require_relative 'lib/player'


player1 = Player.new("raja")
player2 = Player.new("haingo")

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

# binding.pry