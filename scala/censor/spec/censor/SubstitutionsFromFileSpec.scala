package censor

import org.scalatest.FunSpec
import org.scalatest.matchers.ShouldMatchers._
import java.io.{PrintWriter, File}

class SubstitutionsFromFileSpec extends FunSpec {
  describe("Substitutions from File") {
    val file = File.createTempFile("substitutions", "tmp")
    file.deleteOnExit()
    val subject = new SubstitutionsFromFile { val filename = file.getPath }

    it("loads substitution map from a file") {
      open(file) { file => file.println("one:two") }
      subject.substitutions should equal(Map("one" -> "two"))
    }

    it("allows optional spaces around colon") {
      open(file) { file => file.println("one :   two") }
      subject.substitutions should equal(Map("one" -> "two"))
    }

    it("allows colons in substitution") {
      open(file) { file => file.println("one: two:three") }
      subject.substitutions should equal(Map("one" -> "two:three"))
    }
  }

  def open(file: File)(f: PrintWriter => Unit) = {
    val writer = new PrintWriter(file)
    try {
      f(writer)
    } finally {
      writer.close()
    }
    file
  }
}
