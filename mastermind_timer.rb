require_relative 'mastermind_game'
class Timer
attr_reader :start, :finish

  def initialize
   @start = nil
   @finish = nil

  end

  def start_timer
    @start = Time.now #Game
  end

  def finish_timer
    @finish = Time.now #Game
  end

  def elapsed #Output
    @finish - @start
  end

  def start_minutes
    start_timer_minutes = start.min
  end

  def finish_minutes
    finish_timer_minutes = finish.min
  end

end
