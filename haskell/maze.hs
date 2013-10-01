module Maze where

  --
  -- Solve a maze
  --
  -- Example
  --
  --     0 1 2 3
  --     _______
  --  0 | |  __ |
  --  1 | | |___|
  --  2 |_____|_|
  --
  --   let maze = [
  --     (Node (0,0) (Exits [(0,1)])), (Node (0,1) (Exits [(0,0), (0,2)])), (Node (0,2) (Exits [(0,1), (1,2)])),
  --     (Node (1,0) (Exits [(1,1), (2,0)])), (Node (1,1) (Exits [(1,0), (1,2)])), (Node (1,2) (Exits [(0,2), (1,1), (2,2)])),
  --     (Node (2,0) (Exits [(1,0), (3,0)])), (Node (2,1) (Exits [(3,1)])), (Node (2,2) (Exits [(1,2)])),
  --     (Node (3,0) (Exits [(2,0), (3,1)])), (Node (3,1) (Exits [(3,0), (2,1)])), (Node (3,2) (Exits []))
  --   ]
  --   in
  --     solve maze (0,0) (2,1) --> Just [(0,0),(0,1),(0,2),(1,2),(1,1),(1,0),(2,0),(3,0),(3,1),(2,1)]
  --     solve maze (0,0) (3,2) --> Nothing


  import Control.Monad
  import Data.List

  type Maze = [Node]
  data Node = Node Position Exits
    deriving Show
  data Exits = Exits [Position]
    deriving Show
  type Position = (Int, Int)

  solve :: Maze -> Position -> Position -> Maybe [Position]
  solve maze start exit =
    case explore [start] of
      [] -> Nothing
      trails -> Just $ reverse $ trails !! 0
    where
      explore trail@(pos:_)
        | pos == exit = return trail
        | otherwise = do
            exit <- (exits $ at maze pos) \\ trail
            explore (exit:trail)

  exits Nothing = []
  exits (Just (Node _ (Exits exits))) = exits

  at :: Maze -> Position -> Maybe Node
  at [] _ = Nothing
  at (node@(Node p _):rest) pos
    | p == pos = Just node
    | otherwise = at rest pos

