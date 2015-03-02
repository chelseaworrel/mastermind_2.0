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

class Board #need to create as a sep. file
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

  def too_long?(guess)
    guess.length > 4
  end

  def too_short?(guess)
    guess.length < 4
  end

  def check_input(secret, guess)
    if guess == 'c'
      puts "Cheater: #{secret}".cyan
    elsif !too_short?(guess) && !too_long?(guess)
      correct_position(secret, guess)
      matcher(secret, guess)
    else
      puts "Please guess a four letter sequence".red
    end
  end

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
     matcher(secret, guess)
  end
end
