module Revert where
  revert :: [a] -> [a]
  revert [] = []
  revert (h:t) = snoc (revert(t)) h
    where
      snoc [] a = [a]
      snoc (h:t) a = h:snoc t a

