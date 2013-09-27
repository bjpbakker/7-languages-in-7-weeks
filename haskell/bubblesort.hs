module Bubblesort where

  bubblesort :: (Ord a) => [a] -> [a]
  bubblesort list = bubblesort_with (\a b -> compare a b) list

  bubblesort_with :: (a -> a -> Ordering) -> [a] -> [a]
  bubblesort_with _ [] = []
  bubblesort_with f (x:t) = bubble f x $ bubblesort_with f t
    where
      bubble _ x [] = [x]
      bubble f x (y:t) | f x y == GT = y:bubble f x t
                       | otherwise   = x:y:t

