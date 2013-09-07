package tictactoe.players

import tictactoe.board.Board

trait Player {
  val character: Char
  def play(board: Board): (Int, Int)
}
