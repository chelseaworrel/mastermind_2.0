require_relative 'input'
require_relative 'output'
require_relative 'game'

output = Output.new

output.greeting
output.main_menu
user_input = ""

while user_input != 'q'
  print '> '
  user_input = gets.chomp
  if user_input == 'i'
    output.instructions
  elsif user_input == 'p'
    game = Game.new
    game.begin_game
  elsif user_input == 'q'
    output.quit
  end
end
