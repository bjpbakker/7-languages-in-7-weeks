module Primes where

  primes :: [Integer]
  primes = 2 : eratosthenes[3,5 ..] where
    eratosthenes [] = []
    eratosthenes (p:rest) = p : eratosthenes(rest `diff` [p, p + 2*p])

    diff (x:xs) (y:ys) = case (compare x y) of
        LT -> x : diff xs (y:ys)
        EQ -> diff xs ys
        GT -> diff (x:xs) ys
    diff xs _ = xs

