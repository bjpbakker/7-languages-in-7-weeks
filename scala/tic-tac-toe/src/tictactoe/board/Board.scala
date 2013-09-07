package tictactoe.board

import math._
import scala.language.implicitConversions

object Board {
  def apply(size: Int): Board = {
    val cells = (1 to size * size).map(_ => None)
    new Board(cells)
  }
  def apply(cells: Seq[Option[Char]]) = new Board(cells)
}

class Board(val cells: Seq[Option[Char]]) {
  val size = round(sqrt(cells.size)).toInt match {
    case n if n * n == cells.size => n
    case _ => throw new SquareBoardRequired
  }

  def rows: Seq[Seq[Option[Char]]] = rows(cells)
  def columns: Seq[Seq[Option[Char]]] = columns(cells)
  def diagonals: Seq[Seq[Option[Char]]] = diagonals(cells)

  def getCell(position: (Int, Int)): Option[Char] = cells(position)
  def withCell(position: (Int, Int), value: Char): Board = {
    cells(position).flatMap(_ => { throw new CellIsAlreadyOccupied })
    Board(cells.updated(position, Some(value)))
  }

  private implicit def cellIndex(position: (Int, Int)): Int = position._1 * size + position._2

  private def rows(board: Seq[Option[Char]]): Seq[Seq[Option[Char]]] = board match {
    case empty if empty.size == 0 => Seq()
    case list if list.size > 0 =>
      Seq(board.take(size)) ++ rows(board.drop(size))
  }

  private def columns(board: Seq[Option[Char]]) = {
    rows(board).transpose
  }

  private def diagonals(board: Seq[Option[Char]]) = {
    Seq(leftToRight(rows(board)), rightToLeft(rows(board)))
  }

  private def leftToRight(rows: Seq[Seq[Option[Char]]]): Seq[Option[Char]] = {
    leftToRight(rows, 1)
  }

  private def leftToRight(rows: Seq[Seq[Option[Char]]], n: Int): Seq[Option[Char]] = rows match {
    case empty if empty.size == 0 => Seq()
    case list if list.size > 0 =>
      Seq(rows.head.drop(n - 1).head) ++ leftToRight(rows.tail, n + 1)
  }

  private def rightToLeft(rows: Seq[Seq[Option[Char]]]): Seq[Option[Char]] = {
    rightToLeft(rows, rows.size)
  }

  private def rightToLeft(rows: Seq[Seq[Option[Char]]], n: Int): Seq[Option[Char]] = rows match {
    case empty if empty.size == 0 => Seq()
    case list if list.size > 0 =>
      Seq(rows.head.drop(n - 1).head) ++ rightToLeft(rows.tail, n - 1)
  }
}

class SquareBoardRequired extends RuntimeException
class CellIsAlreadyOccupied extends RuntimeException
