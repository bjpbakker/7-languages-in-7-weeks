module Lookup where

  lookup_value key [] = Nothing
  lookup_value key ((candidate, value):rest)
    | candidate == key = Just value
    | otherwise = lookup key rest

  test_data = [("something", [("message", "Hello, world!")]),
               ("empty", [])]

  lookup_message hash = lookup_value "message" hash

  get_message = lookup_value "something" test_data
                  >>= lookup_message
                  >>= return

  get_nothing = lookup_value "empty" test_data
                  >>= lookup_message
                  >>= return

