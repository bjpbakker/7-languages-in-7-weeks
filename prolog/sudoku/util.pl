partition(_, [], []).
partition(N, List, [Part|Acc]) :-
  take(N, List, Part, Rest),
  partition(N, Rest, Acc).

transpose([], []).
transpose([[]|_], []).
transpose(Matrix, [First|T]) :-
  transpose_first(Matrix, First, Rest),
  transpose(Rest, T).

transpose_first([], [], []).
transpose_first([Head|Tail], [First|T], [Rest|R]) :-
  first(Head, First, Rest),
  transpose_first(Tail, T, R).

squares(Puzzle, Squares) :-
  size_of(Puzzle, Size),
  square_size(Size, Width, Height),
  partition(Size, Puzzle, Rows),
  squares(Rows, Width, Height, Squares).

squares([], _, _, []).
squares(Rows, Width, Height, All) :-
  take(Height, Rows, Row, Rest),
  transpose(Row, T),
  flatten(T, F),
  SquareLength is Width * Height,
  partition(SquareLength, F, S),
  squares(Rest, Width, Height, Squares),
  append(S, Squares, All).

square_size(Size, Width, Height) :-
  Size = SquareLength,
  Width is ceiling(sqrt(Size)),
  Height is floor(sqrt(Size)),
  SquareLength is Width * Height.

first([Head|Tail], Head, Tail).

take(0, List, [], List).
take(N, [Head|Tail], [Head|Take], R) :-
  N > 0,
  Next is N - 1,
  take(Next, Tail, Take, R).

size_of(Puzzle, Size) :-
  length(Puzzle, Len),
  sqrt_int(Len, Size).

sqrt_int(N, S) :-
  S = SquareInt,
  SquareInt is floor(sqrt(N)),
  Squared is SquareInt * SquareInt,
  N = Squared.
