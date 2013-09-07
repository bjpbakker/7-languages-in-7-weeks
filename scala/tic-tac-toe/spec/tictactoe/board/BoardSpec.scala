package tictactoe.board

import org.scalatest.FunSpec
import org.scalatest.matchers.ShouldMatchers._

class BoardSpec extends FunSpec {
  describe("Board") {
    it("has a size") {
      val board = Board(size = 3)
      board.size should equal(3)
    }

    it("throws as board is not square") {
      evaluating(Board(Seq(None, None, None))) should produce[SquareBoardRequired]
    }

    it("gets cells as rows") {
      val board = Board(3).withCell((0,0), 'X').withCell((2,2), 'O')
      board.rows should equal(Seq(Seq(Some('X'), None, None),
                                  Seq(None, None, None),
                                  Seq(None, None, Some('O'))))
    }

    it("gets cells as columns") {
      val board = Board(3).withCell((0,0), 'X').withCell((1,0), 'O').withCell((2,2), 'O')
      board.columns should equal(Seq(Seq(Some('X'), Some('O'), None),
                                     Seq(None, None, None),
                                     Seq(None, None, Some('O'))))
    }
    it("gets cells as diagonals") {
      val board = Board(3).withCell((0,0), 'X').withCell((0,2), 'O').withCell((2,0), 'X').withCell((2,2), 'O')
      board.diagonals should equal(Seq(Seq(Some('X'), None, Some('O')),
                                       Seq(Some('O'), None, Some('X'))))
    }

    it("throws as updated cell is not empty") {
      val board = Board(3).withCell((0,0), 'O')
      evaluating(board.withCell((0,0), 'X')) should produce[CellIsAlreadyOccupied]
    }
  }
}
