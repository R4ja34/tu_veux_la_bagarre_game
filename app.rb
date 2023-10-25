require 'bundler'
Bundler.require

require_relative 'lib/test'
require_relative 'lib/player'


player1 = Player.new("raja")
player2 = Player.new("haingo")

while true
  player2.show_status
  player1.hit_someone(player2)
  player2.show_status
  puts " "
  if player2.death
    break
  end
  player1.show_status
  player2.hit_someone(player1)
  player1.show_status
  puts " "
  if player1.death
    break
  end
end
