package tictactoe.game

import tictactoe.players.Player
import tictactoe.board.Board
import tictactoe.support.Functions._

class Game(val view: View, val dice: Dice) {
  def play(player1: Player, player2: Player) {
    var board: Board = Board(size = 3)
    val players = determineStarter(player1, player2)

    view.start(players._1.character)
    turns(cells = board.size * board.size, players._1, players._2).toStream
      .takeWhile(_ => {Judge(board).isEmpty})
      .foreach(player => board = playRound(player, board))
    endOfGame(board)
  }

  private def determineStarter(player1: Player, player2: Player) = {
    dice.roll(eyes = 2) match {
      case 1 => (player1, player2)
      case 2 => (player2, player1)
    }
  }

  private def turns(cells: Int, starter: Player, opponent: Player): Seq[Player] = {
    0 to (cells - 1) map(_ match {
      case even if even % 2 == 0 => starter
      case odd if odd % 2 == 1 => opponent
    })
  }

  private def playRound(player: Player, board: Board): Board = {
    view.printBoard(board)
    move(player, board)
  }


  private def move(player: Player, board: Board): Board = {
    failSafe {
      val position = player.play(board)
      board.withCell(position, player.character)
    } fold(
      board => board,
      error => move(player, board)
    )
  }

  private def endOfGame(board: Board) = Judge(board) match {
    case winner: Some[Char] => view.won(winner.get)
    case None => view.tie()
  }
}