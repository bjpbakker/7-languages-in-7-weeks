package tictactoe.game

import scala.util.Random

object RandomDice extends Dice {
  def roll(eyes: Int) = Random.nextInt(eyes) + 1
}
