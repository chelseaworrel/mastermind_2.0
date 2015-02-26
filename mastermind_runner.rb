require_relative 'mastermind_input'
require_relative 'mastermind_output'
require_relative 'mastermind_game'

mastermind = MastermindGame.new
output = Output.new
menu = Input.new
in_game = false

output.greeting

while in_game == false
  output.main_menu
  user_input = gets.chomp
  menu.main_menu_user_input(user_input)
end

#  won = false
# until won = true
#
# end
