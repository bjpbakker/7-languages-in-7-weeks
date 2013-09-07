package tictactoe.game

import tictactoe.board.Board

object Judge {
  def apply(board: Board) = {
    (board.rows ++ board.columns ++ board.diagonals)
      .filter(allCellsFilled)
      .find(bySamePlayer)
      .flatMap(_.head)
  }

  private def allCellsFilled: (Seq[Option[Char]]) => Boolean = {
    _.collect {
      case x: Some[Char] => x
    }.size == 3
  }

  private def bySamePlayer: (Seq[Option[Char]]) => Boolean = {
    _.distinct.size == 1
  }
}