module Lazy where

  thirds x = [x, x + 3..]
  fifths y = [y, y + 5..]
  eights x y = zipWith (+) (thirds x) (fifths y)

