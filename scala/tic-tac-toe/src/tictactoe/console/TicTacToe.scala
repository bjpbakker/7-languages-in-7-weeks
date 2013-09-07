package tictactoe.console

import tictactoe.game.{RandomDice, Game}
import tictactoe.players.HumanPlayer

object TicTacToe extends App {
  val view = ConsoleView
  val game = new Game(view, RandomDice)
  game.play(new HumanPlayer('X', view), new HumanPlayer('O', view))
}