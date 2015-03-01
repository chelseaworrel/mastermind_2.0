require_relative 'mastermind_output'
require_relative 'mastermind_timer'

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
    until win? || @user_input == "q"
      print "> "
      @user_input = gets.chomp
      puts @secret if @user_input == "c"
      puts @board.correct_position(@secret, @user_input)
      puts @board.incorrect_position(@secret, @user_input)
      @time.finish_timer if win?
      puts Time.now - @time.start
      if win?
        @output.congratulations(@secret,@time.elapsed)
      end
    end
  end

  def win?
    @secret == @user_input.split("")
  end

end

class Board
attr_reader :create_secret

  def initialize
    @create_secret
  end

  def create_secret
    colors = ["r","b","y","g"]
    colors.map do |letter|
      colors.sample
    end
  end

  # def evaluate_a_guess
  #   if guess == create_secret
  #       output.winner
  #       output.congratulations
  #      won == true
  #      in_game ==false
  #     else
  #      output.guess_again
  #      in_game == true
  #   end
  # end

  def correct_position(secret, guess)
    count = 0
    guess = guess.split("")
    secret.map.with_index do |letter, index|
      if secret[index] == guess[index]
        count += 1
      end
    end
    count
  end

  def hash_builder(array)
    array.inject(Hash.new(0)) do |hash, color|
      hash[color] += 1
      hash
    end
  end

  def matcher(secret, guess)
    guess = guess.split("")
    secret_hash = hash_builder(secret)
    guess_hash = hash_builder(guess)

    colors = ["r","b","y","g"]
    colors.map do |color|
      [secret_hash[color], guess_hash[color]].min
    end.reduce(:+)
  end

  def incorrect_position(secret, guess)
    matcher(secret, guess) - correct_position(secret, guess)
  end
end
