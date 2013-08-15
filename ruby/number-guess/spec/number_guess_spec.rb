require_relative '../lib/number_guess'

describe NumberGuess do
  let(:secret_number) { 5 }
  let(:view) { double(:view) }
  let(:game) { NumberGuess.new secret_number }

  context "on correct guess" do
    it "is won" do
      view.stub(:take_guess).and_return secret_number
      view.should_receive :game_won
      game.play view
    end
  end

  context "on wrong guess" do
    let(:wrong_number) { 3 }

    before(:each) do
      view.stub :wrong_guess
      view.stub :take_guess
      view.stub :game_won
      view.stub(:take_guess).and_return wrong_number, secret_number
    end

    it "reports wrong guess" do
      view.should_receive :wrong_guess
      game.play view
    end

    it "asks for new guess as guess is wrong" do
      view.should_receive :take_guess
      game.play view
    end

    it "is won as next guess is correct" do
      view.should_receive(:wrong_guess).ordered
      view.should_receive(:game_won).ordered
      game.play view
    end

    it "reports that guess is too low" do
      view.should_receive(:wrong_guess).with(:too_low)
      game.play view
    end

    it "reports that guess is too high" do
      view.stub(:take_guess).and_return secret_number + 1, secret_number
      view.should_receive(:wrong_guess).with(:too_high)
      game.play view
    end
  end

end
