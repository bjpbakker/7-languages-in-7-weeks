package tictactoe.game

import org.scalatest.FunSpec
import org.scalatest.matchers.ShouldMatchers._
import tictactoe.board.Board

class JudgeSpec extends FunSpec {
  describe("Judge") {
    it("detects no winner as board is empty") {
      val board = Board(3)
      Judge(board) should equal(None)
    }

    it("detects no winner as none has full row, column or diagonal board") {
      val board = Board(3).withCell((1,0), 'X').withCell((2,2), 'X')
      Judge(board) should equal(None)
    }

    it("detects winner X as X has a full row") {
      val board = Board(3).withCell((0,0), 'X').withCell((0,1), 'X').withCell((0,2), 'X')
      Judge(board) should equal(Some('X'))
    }

    it("detects winner X as X has a full column") {
      val board = Board(3).withCell((0,0), 'X').withCell((1,0), 'X').withCell((2,0), 'X')
      Judge(board) should equal(Some('X'))
    }

    it("detects winner X as X has full left-to-right diagonal") {
      val board = Board(3).withCell((0,0), 'X').withCell((1,1), 'X').withCell((2,2), 'X')
      Judge(board) should equal(Some('X'))
    }

    it("detects winner X as X has full right-to-left diagonal") {
      val board = Board(3).withCell((0,2), 'X').withCell((1,1), 'X').withCell((2,0), 'X')
      Judge(board) should equal(Some('X'))
    }
  }
}