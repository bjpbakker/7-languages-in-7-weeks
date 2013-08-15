class Round
  attr_reader :result

  def self.first
    Round.new(:started)
  end

  def self.won
    Round.new(:game_won)
  end

  def initialize result
    @result = result
  end

  def play secret, guess
    if guess == secret
      Round.won
    else
      result = guess < secret ? :too_low : :too_high
      Round.new result
    end
  end

  def won?
    @result == :game_won
  end
end
