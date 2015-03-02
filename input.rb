require_relative 'output'

class Input
  attr_reader :output

  def initialize
    @output = Output.new
  end

  def main_menu_user_input(input)
    if input == 'p'
      output.play_game
      user_input = gets.chomp
      in_game == true
    end

    if input == 'i'
      output.instructions
      user_input = gets.chomp
      if input == 'p'
        in_game == true
        output.play_game
      end

    elsif input == 'q'
      output.quit
      in_game = true

    elsif input == 'p'
      output.play_game
    end
  end



end
