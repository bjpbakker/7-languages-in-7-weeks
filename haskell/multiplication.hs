module Multiplication where
  table n = [ ( x, y, x*y ) | x <- range, y <- range]
    where range = [1..n]

