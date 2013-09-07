package censor

import scala.io.Source

trait SubstitutionsFromFile {
  def filename: String
  def substitutions: Map[String, String] = {
    Source.fromFile(filename).getLines().map(line => {
        val split = line.split("\\s*:\\s*", 2)
        split(0) -> split(1)
      }).toMap
  }
}
