TailRecursiveFibonacci := Object clone do (
  fib := method(n,
    recur(n, 0, 1)
  )

  recur := method(n, lastFib, fib,
    if (n == 0,
      lastFib,
      nextFib := fib + lastFib
      return recur(n - 1, fib, nextFib)
    )
  )
)
