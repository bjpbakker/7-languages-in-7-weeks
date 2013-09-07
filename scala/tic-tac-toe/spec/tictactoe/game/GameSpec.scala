package tictactoe.game

import org.scalatest.FunSpec
import org.scalatest.matchers.ShouldMatchers._
import tictactoe.players.ProgrammablePlayer
import scala.collection.mutable
import tictactoe.board.Board

class GameSpec extends FunSpec {
  describe("Game") {
    val view = new CapturingView

    describe("when won by player1") {
      val player1 = new ProgrammablePlayer('X', Seq((0,0), (0,1), (0,2)))
      val player2 = new ProgrammablePlayer('O', Seq((1,0), (1,1), (1,2)))
      val letPlayer1Start = new CheatingDice(1)
      val game = new Game(view, letPlayer1Start)

      it("prints that player1 has won") {
        game.play(player1, player2)
        view.messages should contain("WON:X")
      }
    }

    describe("when won by player2") {
      val player1 = new ProgrammablePlayer('X', Seq((0,0), (0,1), (0,2)))
      val player2 = new ProgrammablePlayer('O', Seq((1,0), (1,1), (1,2)))
      val letPlayer2Start = new CheatingDice(2)
      val game = new Game(view, letPlayer2Start)

      it("prints that player2 has won") {
        game.play(player1, player2)
        view.messages should contain("WON:O")
      }
    }

    describe("when tie") {
      val player1 = new ProgrammablePlayer('X', Seq((0,1), (1,0), (1,2), (2,0), (2,2)))
      val player2 = new ProgrammablePlayer('O', Seq((0,0), (0,2), (1,1), (2,1)))
      val letPlayer1Start = new CheatingDice(1)
      val game = new Game(view, letPlayer1Start)

      it("prints that the game ended in a tie") {
        game.play(player1, player2)
        view.messages should contain("TIE")
      }
    }
  }
}

class CapturingView extends View {
  val messages = mutable.MutableList[String]()

  def won(winner: Char) = messages += "WON:" + winner
  def tie() = messages += "TIE"

  def start(starter: Char) {}
  def printBoard(board: Board) {}
  def inputPosition(player: Char): (Int, Int) = (-1,-1)
}
