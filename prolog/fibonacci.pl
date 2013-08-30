naivefib(0, 0).
naivefib(1, 1).
naivefib(N, Fib) :-
  N > 1,
  Pre1 is N - 1, Pre2 is N - 2,
  naivefib(Pre1, Fib1), naivefib(Pre2, Fib2),
  Fib is Fib1 + Fib2.

fib(0, Fib, _, Fib).
fib(N, LastFib, Fib, Result) :-
  N > 0,
  Next is N - 1, NextFib is LastFib + Fib,
  fib(Next, Fib, NextFib, Result).
fib(N, Fib) :- fib(N, 0, 1, Fib).
