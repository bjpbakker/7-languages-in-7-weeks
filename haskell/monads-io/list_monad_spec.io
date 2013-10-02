doRelativeFile("list_monad.io")

describe ("List Monad") do (
  it ("wraps a single value") do (
    List wrap("value") == list("value")
  )

  it ("passes values to a block") do (
    inc := block(n, List wrap(n + 1))
    list(1,2) pass(inc) should == list(2,3)
  )

  it ("passes nested list to a block") do (
    identity := block(n, List wrap(n))
    list(list(1,2), list(3,4)) pass(identity) should == list(list(1,2), list(3,4))
  )

  it ("gets zero value") do (
    List mzero should == list
  )
)
