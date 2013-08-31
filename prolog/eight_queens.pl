aight_queens(Cols) :-
  board_by_cols(Cols, Board),
  solve_eight_queens(Board),
  cols(Board, Cols).

eight_queens(N, Solution) :-
  Solution = Board,
  board_by_index(N, Board),
  solve_eight_queens(Board).

solve_eight_queens(Board) :-
  valid_board(Board),
  cols(Board, Cols),
  diags1(Board, Diags1),
  diags2(Board, Diags2),
  fd_all_different(Cols),
  fd_all_different(Diags1),
  fd_all_different(Diags2).

board_by_cols(Cols, Board) :- board_by_cols(Cols, 1, Board).
board_by_cols([Col|Cols], N, [(N, Col)|Board]) :-
  Next is N + 1,
  board_by_cols(Cols, Next, Board).
board_by_cols([], _, []).

board_by_index(N, Board) :- board_by_index(N, [], Board).
board_by_index(N, Acc, Board) :-
  N > 0,
  Next is N - 1,
  board_by_index(Next, [(N, _)|Acc], Board).
board_by_index(0, Acc, Acc).

valid_board(Board) :-
  length(Board, Length),
  range(1, Length, Range),
  valid_board(Board, Range).
valid_board([], _).
valid_board([Head|Tail], Range) :-
  valid_queen(Head, Range), valid_board(Tail, Range).
valid_queen((_, Col), Range) :-
  member(Col, Range).

cols([], []).
cols([(_, Col)|QueensTail], [Col|ColsTail]) :-
  cols(QueensTail, ColsTail).

diags1([], []).
diags1([(Row, Col)|QueensTail], [Diagonal|DiagonalsTail]) :-
  Diagonal is Col - Row,
  diags1(QueensTail, DiagonalsTail).

diags2([], []).
diags2([(Row, Col)|QueensTail], [Diagonal|DiagonalsTail]) :-
  Diagonal is Col + Row,
  diags2(QueensTail, DiagonalsTail).

range(N, N, [N]).
range(Start, End, [Start|R]) :-
  Start < End,
  Next is Start + 1,
  range(Next, End, R).

