package censor

import org.scalatest.FunSpec
import org.scalatest.matchers.ShouldMatchers._

class CensorSpec extends FunSpec {
  describe("Censor") {
    val subject = new Censor with English {}

    it ("returns text that needs no censoring") {
      subject.censor("some nice text") should equal("some nice text")
    }

    it ("censors 'shoot' with 'pucky' alternative") {
      subject.censor("shoot ain't a bad word") should equal("pucky ain't a bad word")
    }

    it ("censors 'darn' with 'beans' alternative") {
        subject.censor("another darn talk") should equal("another beans talk")
    }

    it ("applies original capitalization") {
      subject.censor("Shoot") should equal("Pucky")
      subject.censor("SHOOT") should equal("PUCKY")
    }
  }
}
