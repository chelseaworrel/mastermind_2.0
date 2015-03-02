require 'colorize'
require_relative 'game'

class Output

  def greeting
    print "\e[2J\e[f"

    puts'                  _                                  _  '.blue
    puts'  /\/\   __ _ ___| |_ ___ _ __ _ __ ___ (_)_ __   __| | '.blue
    puts' /    \ / _` / __| __/ _ \  __|  _ ` _ \| |  _ \ / _` | '.light_blue
    puts'/ /\/\ \ (_| \__ \ ||  __/ |  | | | | | | | | | | (_| | '.cyan
    puts'\/    \/\__,_|___/\__\___|_|  |_| |_| |_|_|_| |_|\__,_| '.light_cyan

    puts "\n"
    puts "\n"
    puts "\n"
  end

  def main_menu
      puts 'MAIN MENU: Would you like to (p)lay, read the (i)nstructions,
      (c)heat or (q)uit? -ENTER A COMMAND:'
  end

  def play_game
    puts "\n"
    puts 'I have generated a beginner sequence with four elements made up of:'
    puts '(r)ed'.red
    puts '(g)reen'.green
    puts '(b)lue'.blue
    puts '(y)ellow'.yellow
    puts '\n'
    puts 'Use (q)uit to end the game.'.cyan
    puts "\n"
    puts 'What it your guess?'
  end

  def instructions
    puts 'INSTRUCTIONS:

    Once the game begins, a random mystery sequence code will be generated
    consisting of the following 4 elements:'
    puts '(r)ed'.red
    puts '(y)ellow'.yellow
    puts '(g)reen'.green
    puts '(b)lue'.blue
    puts "\n"
    puts"This code will be hidden from you.
    Your task is to guess the code AS FAST AS YOU CAN!


    Along the way, you will be given hints about the code,
    until you guess the correct code.

    Guess wisely, enter command (p)lay and let's begin...."
    puts "\n"
  end


  def quit
    puts 'Winners never quit, and quitters never win...Goodbye'.cyan
  end

  def winner
    puts 'Winner!'
  end

  def congratulations(secret, timer)
    puts "Congratulations! You guessed the sequence #{secret}
    in #{timer} seconds.".magenta
    puts 'Do you want to (p)lay again or (q)uit?'
  end
end
