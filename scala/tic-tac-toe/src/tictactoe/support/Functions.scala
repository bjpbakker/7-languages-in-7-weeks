package tictactoe.support

object Functions {
  def failSafe[T](f: => T): Either[T, Exception] = {
    try {
      Left(f)
    } catch {
      case e: Exception => Right(e)
    }
  }
}
