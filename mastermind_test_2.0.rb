gem 'minitest'
require 'minitest/autorun'
require 'minitest/pride'
require_relative 'mastermind_game'
require_relative 'mastermind_output'


class BoardTest < Minitest::Test

  def test_it_outputs_an_array
    board = Board.new

    result = board.create_secret

    assert_equal Array, board.create_secret.class
  end

  def test_it_returns_four
    board = Board.new

    result = board.create_secret.length

    assert_equal 4, result
  end

  def test_it_returns_different_colors
    board = Board.new

    result = board.create_secret
    result_two = board.create_secret

    refute_equal result, result_two
  end

  def test_it_returns_a_fixnum
    board = Board.new

    result = board.correct_position(["r","g","y","g"], "rbbb")

    assert_equal Fixnum, result.class
  end

  def test_it_can_check_one_correct_position
    board = Board.new

    result = board.correct_position(["r","g","y","g"], "rbbb")

    assert_equal 1, result
  end

  def test_it_can_check_two_correct_positions
    board = Board.new

    result = board.correct_position(["r","g","y","g"], "rgbb")

    assert_equal 2, result
  end

  def test_it_can_check_three_correct_positions
    board = Board.new

    result = board.correct_position(["r","g","y","g"], "rgyb")

    assert_equal 3, result
  end

  def test_it_can_check_all_correct_positions
    board = Board.new

    result = board.correct_position(["r","g","y","g"], "rgyg")

    assert_equal 4, result
  end

  def test_it_can_check_no_correct_positions
    board = Board.new

    result = board.correct_position(["g","g","y","g"], "rrrr")

    assert_equal 0, result
  end

  def test_it_can_build_a_hash
    board = Board.new

    result = board.hash_builder(["r","g","y","g"])

    assert_equal 2, result["g"]
    assert_equal 1, result["r"]
  end

  def test_matcher_gives_right_color_guesses
    board = Board.new
    secret = ["r","g","y","g"]
    guess = "rybb"

    result = board.matcher(secret, guess)

    assert_equal 2, result
  end

  def test_incorrect_positions_gives_right_answer
    skip
    board = Board.new
    secret = ["r","g","y","g"]
    guess = "rybb"

    result = board.incorrect_position(secret, guess)

    assert_equal 1, result
  end

  def test_incorrect_positions_returns_a_fixnum
    board = Board.new
    secret = ["r","g","y","g"]
    guess = "rybb"

    result = board.incorrect_position(secret, guess)

    assert_equal Fixnum, result.class
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
