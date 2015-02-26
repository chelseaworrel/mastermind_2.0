require_relative 'mastermind_output'


class Input
  attr_reader :output

  def initialize
    @output = Output.new
  end

  def main_menu_user_input(input)
    if input == 'i'
      output.instructions

    elsif input == 'q'
      output.quit
      in_game = true

    elsif input == 'p'
      output.play_game
    end
  end

end
