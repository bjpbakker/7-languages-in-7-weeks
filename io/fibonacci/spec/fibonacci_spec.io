doRelativeFile("../src/naive_fibonacci.io")
doRelativeFile("../src/tail_recursive_fibonacci.io")
doRelativeFile("../src/destructive_fibonacci.io")

implementations := list(NaiveFibonacci, TailRecursiveFibonacci, DestructiveFibonacci)
implementations foreach(implementation,
  describe(implementation) do (
    it ("gets 1 for position 1") do (
      subject fib(1) should == 1
    )

    it ("gets 1 for position 2") do (
      subject fib(2) should == 1
    )

    it ("gets 2 for position 3") do (
      subject fib(3) should == 2
    )

    it ("gets 3 for position 4") do (
      subject fib(4) should == 3
    )

    it ("gets 5 for position 5") do (
      subject fib(5) should == 5
    )


    it ("gets 144 for position 12") do (
      subject fib(12) should == 144
    )
  )
)
