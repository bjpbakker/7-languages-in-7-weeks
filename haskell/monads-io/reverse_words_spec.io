describe ("Reverse words") do (
  it ("uses list monad given a list of words") do (
    reversed := list("one", "two", "three") \
      pass(block(seq, List wrap(seq characters))) \
      pass(block(l, List wrap(l reverse))) \
      pass(block(l, List wrap(l join)))
    reversed should == list("eno", "owt", "eerht")
  )
)

Sequence characters := method(seq,
  chars := list
  self foreach(n,
    chars append(n asCharacter)
  )
  chars
)
