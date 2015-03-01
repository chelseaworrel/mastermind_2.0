require_relative 'mastermind_input'
require_relative 'mastermind_output'
require_relative 'mastermind_game'

board = Board.new
output = Output.new
menu = Input.new
in_game = false

output.greeting

while in_game == false
  output.main_menu
  user_input = gets.chomp
  menu.main_menu_user_input(user_input)
until in_game == true
  output.play_game
  user_input = gets.chomp
  output.play_game
end

end
#  won = false
# until won = true
#
# end
