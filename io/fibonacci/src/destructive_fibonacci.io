DestructiveFibonacci := Object clone do (
  fib := method(position,
    fibs := list(1, 1)
    for(current, 3, position,
      fibs append(fibs at(current - 2) + fibs at(current - 3))
    )
    fibs last
  )
)
