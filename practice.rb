class Board
  def initialize
  end

  def create_secret
    colors = ["r","b","y","g"]
    colors.map do |letter|
      colors.sample
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
    matcher(secret, guess) - correct_position(secret, guess)
  end
end
