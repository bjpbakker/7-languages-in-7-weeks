package tictactoe.game

class CheatingDice(val roll: Int) extends Dice {
   def roll(eyes: Int): Int = roll
 }
