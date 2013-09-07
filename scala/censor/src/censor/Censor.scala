package censor

trait Censor {
  def substitutions: Map[String, String]

  def censor(text: String): String = {
    text.split("\\b").map(censorWord).mkString("")
  }

  private def censorWord(word: String) = word match {
    case curse if isCurse(word) => sameCapitalization(word, substitute(curse))
    case _ => word
  }

  private def isCurse(word: String) = substitutions.contains(word.toLowerCase)

  private def substitute(word: String) = substitutions(word.toLowerCase)

  private def sameCapitalization(original: String, word: String) = original match {
    case upper if original.forall(_.isUpper) => word.toUpperCase
    case capitalized if original.head.isUpper => word.capitalize
    case _ => word
  }
}
