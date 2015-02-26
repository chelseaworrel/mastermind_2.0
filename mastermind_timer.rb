class Timer
attr_reader :start, :finish

  def initialize
   @start = start
   @finish = finish

  end

  def start
    @start = Time.now #Game
  end

  def finish
    @finish = Time.now #Game
  end

  def elapsed #Printer
   elapsed = finish.min - start.min

  end

  def start_minutes
    start_timer_minutes = start.min
  end

  def finish_minutes
    finish_timer_minutes = finish.min
  end



end


timer = Timer.new
puts timer.start_minutes
puts timer.finish_minutes
puts timer.elapsed
