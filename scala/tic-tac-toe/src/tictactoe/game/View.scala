package tictactoe.game

import tictactoe.board.Board

trait View {
  def start(starter: Char)
  def printBoard(board: Board)
  def inputPosition(player: Char): (Int, Int)

  def won(winner: Char)
  def tie()
}
