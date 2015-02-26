class MastermindGame
attr_reader :sequence
attr_accessor :code

  def initialize
    @sequence = ['r','y','b','g'] * 4
    @code = []
  end

  def code
    @code << @sequence.sample(4)
  end

end

game = MastermindGame.new
# puts game.sequence
puts game.code
