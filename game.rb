require_relative 'output'
require_relative 'timer'
require_relative 'board'

class Game

  def initialize
    @output = Output.new
    @board = Board.new
    @secret = @board.create_secret
    @user_input = ""
    @time = Timer.new
  end

  def begin_game
    @time.start_timer
    @output.play_game
    until win? || @user_input == 'q'
      print '> '
      @user_input = gets.chomp
      @board.check_input(@secret, @user_input)
      puts "You have #{@board.correct_position(@secret, @user_input)} correct position(s) out of 4"
      puts "You have #{@board.incorrect_position(@secret, @user_input)} correct color(s) out of 4"
      @time.finish_timer if win?
      puts "Timer: #{Time.now - @time.start} seconds"
      if win?
        @output.congratulations(@secret,@time.elapsed)
      end
    end
  end

  def win?
    @secret == @user_input.split("")
  end

end
