class CommandLineView
  def game_won
    puts "Congratulations, you won this game!"
  end

  def wrong_guess what
    puts "Oops, guessed #{self.send what}."
  end

  def take_guess
    puts "Please take a guess: "
    return gets.to_i
  end

  def too_high; "too high"; end
  def too_low; "too low"; end
end
