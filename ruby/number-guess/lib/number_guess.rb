require_relative 'round'

class NumberGuess
  attr_reader :secret

  def initialize secret
    @secret = secret
  end

  def play view
    round = Round.first
    while not round.won? do
      round = round.play secret, view.take_guess
      view.wrong_guess(round.result) unless round.won?
    end
    view.game_won
  end
end
