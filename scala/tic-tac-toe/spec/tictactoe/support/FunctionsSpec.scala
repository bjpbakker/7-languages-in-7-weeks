package tictactoe.support

import org.scalatest.FunSpec
import org.scalatest.matchers.ShouldMatchers._

import Functions._

class FunctionsSpec extends FunSpec {
  describe("failSafe") {
    it("gets lambda result on the left") {
      failSafe { "result" } should be(Left("result"))
    }

    it("gets exception on the right") {
      val e = new DummyException
      failSafe { throw e } should be(Right(e))
    }
  }
}

class DummyException extends RuntimeException