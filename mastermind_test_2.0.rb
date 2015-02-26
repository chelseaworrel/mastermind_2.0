gem 'minitest'
require 'minitest/autorun'
require 'minitest/pride'
require_relative 'mastermind_game'

class MastermindGameTest < Minitest::Test
  def test_the_game_exsits
    assert MastermindGame.new
  end

  def test_the_game_has_a_sequence
    game = MastermindGame.new
    assert_equal @sequence, @sequence
  end

  def test_the_sequence_can_become_a_code
    game = MastermindGame.new
    assert_respond_to game, :code
  end


end

# require_relative 'mastermind_output'
# require_relative 'mastermind_2.0'

# class OutputTest < Minitest::Test
#   def test_the_menu_exsists
#     assert Output.new
#   end
#
#   def test_you_can_guess_again
#     output = Output.new
#     assert_equal "Guess again!", output.guess_again
#   end
#
#
# end


# class TimerTest  < Minitest::Test
#   def test_the_time_exsists
#     assert Timer.new
#   end
#
#   def test_time_starts
#     timer = Timer.new
#     assert_equal 0, timer.start
#   end
#
#   def test_time_starts_at_1
#     timer = Timer.new
#     assert_equal 1, timer.start
#   end
#
#   def test_time_starts_at_1000
#     timer = Timer.new
#     assert_equal 1000, timer.start
#   end
#
#   def test_time_ends_at_one
#     timer = Timer.new
#     assert_equal 1, timer.finish
#   end
#
#
#   def test_time_ends_at_two
#     timer = Timer.new
#     assert_equal 2, timer.finish
#   end
#
#   def test_time_ends_at_1000
#     timer = Timer.new
#     assert_equal 1000, timer.finish
#   end
#
#   def time_can_start_and_end_at_the_same_time
#     timer = Timer.new
#     assert_equal 0, timer.start
#   end
#end
