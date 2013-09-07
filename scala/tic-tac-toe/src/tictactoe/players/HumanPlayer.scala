package tictactoe.players

import tictactoe.board.Board
import tictactoe.game.View

class HumanPlayer(val character: Char, val view: View) extends Player {
  def play(board: Board): (Int, Int) = view.inputPosition(character)
}
