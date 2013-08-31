:- include(util).
:- include(pretty).

sudoku(Puzzle) :-
  sudoku(Puzzle, Solution),
  pretty(Solution).

sudoku(Puzzle, Solution) :-
  Puzzle = Solution,
	size_of(Puzzle, Size),
  fd_domain(Solution, 1, Size),
  partition(Size, Puzzle, Rows),
  transpose(Rows, Cols),
  squares(Puzzle, Squares),
  valid(Rows, Cols, Squares),
  fd_labeling(Solution).

valid(Rows, Cols, Squares) :-
  valid(Rows), valid(Cols), valid(Squares).

valid([]).
valid([Head|Tail]) :-
  fd_all_different(Head),
  valid(Tail).
