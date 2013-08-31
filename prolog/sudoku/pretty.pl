pretty(Solution) :-
  size_of(Solution, Size),
  partition(Size, Solution, Rows),
  pretty(Rows, Size).

pretty(Rows, Size) :-
  square_size(Size, SquareWidth, SquareHeight),
  HSquares is Size / SquareWidth, CanvasWidth is floor(Size + HSquares + 1),
  pretty(Rows, SquareWidth, SquareHeight, CanvasWidth).
pretty([Head|Tail], SquareWidth, SquareHeight, CanvasWidth) :-
  print_line(CanvasWidth),
  take(SquareHeight, [Head|Tail], Print, Rest),
  pretty_rows(Print, SquareWidth),
  pretty(Rest, SquareWidth, SquareHeight, CanvasWidth).
pretty([], _, _, CanvasWidth) :-
  print_line(CanvasWidth).
  
pretty_rows([Head|Tail], SquareWidth) :-
  partition(SquareWidth, Head, Squares),
  pretty_squares(Squares),
  pretty_rows(Tail, SquareWidth).
pretty_rows([], _).

pretty_squares([Head|Tail]) :-
  write('|'), print_cells(Head),
  pretty_squares(Tail).
pretty_squares([]) :-
  write('|\n').

print_cells([Head|Tail]) :-
  write(Head),
  print_cells(Tail).
print_cells([]).

print_line(Width) :-
  Width > 0,
  write('-'),
  Rest is Width - 1,
  print_line(Rest).
print_line(0) :-
  write('\n').
