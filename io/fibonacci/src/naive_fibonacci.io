NaiveFibonacci := Object clone do (
  fib := method(position, 
    if (position <= 2,
      1,
      fib(position - 1) + fib(position - 2))
  )
)
