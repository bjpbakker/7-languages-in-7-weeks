package tictactoe.players

import tictactoe.board.Board

class ProgrammablePlayer(val character: Char, val moves: Seq[(Int, Int)]) extends Player {
  var lastBoard: Option[Board] = None
  private var moveIndex = 0

  def play(board: Board): (Int, Int) = {
    lastBoard = Some(board)
    nextMove
  }

  private def nextMove = {
    val move = moves(moveIndex)
    moveIndex += 1
    move
  }
}