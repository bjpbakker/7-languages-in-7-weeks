package tictactoe.console

import tictactoe.game.View
import tictactoe.board.Board

import scala.math._

object ConsoleView extends View {
  def start(starter: Char) {
    println("Welcome to a game of Tic-Tac-Toe.")
    println()
    println("Enter your moves in coordinates format. For example: 1,1")
    println()
    println("%s takes the first turn.".format(starter))
  }

  def printBoard(board: Board) {
    println()
    val rowsWithColumnNumber = (1 to board.size).map(n => Some(n)) +: board.rows
    rowsWithColumnNumber.zipWithIndex.foreach { case (row, index) =>
      println("\t" + (index +: row.map(_.getOrElse('_')) mkString " "))
    }
    println()
  }

  def inputPosition(player: Char): (Int, Int) = {
    val input = readLine("%s: What's your move? ".format(player))
    val numbers = input split ","
    (coord(numbers(0)), coord(numbers(1)))
  }

  def coord(input: String): Int = max(input.toInt - 1, 0)

  def won(winner: Char) { println("%s has won this game.".format(winner))}
  def tie() { println("Tie. Nobody wins this game.") }
}