concatenate([], List, List).
concatenate([Head|Tail], List, [Head|Result]) :- concatenate(Tail, List, Result).

count([], 0).
count([_|Tail], Count) :- count(Tail, TailCount), Count is TailCount + 1.

revert([], Acc, Acc).
revert([Head|Tail], Acc, Reversed) :- revert(Tail, [Head|Acc], Reversed).
revert(List, Reversed) :- revert(List, [], Reversed).

min([], Acc, Acc).
min([Head|Tail], Acc, Min) :-
  Head < Acc,
  min(Tail, Head, Min).
min([Head|Tail], Acc, Min) :-
  Head >= Acc,
  min(Tail, Acc, Min).
min([Head|Tail], Min) :- min(Tail, Head, Min).

max([], Max, Max).
max([Head|Tail], Acc, Max) :-
  Head =< Acc,
  max(Tail, Acc, Max).
max([Head|Tail], Acc, Max) :-
  Head > Acc,
  max(Tail, Head, Max).
max([Head|Tail], Max) :- max(Tail, Head, Max).

bubble(Max, [], [], Max).
bubble(Max, [Head|Tail], [Max|Acc], MaxResult) :-
  Max < Head,
  bubble(Head, Tail, Acc, MaxResult).
bubble(Max, [Head|Tail], [Head|Acc], MaxResult) :-
  Max >= Head,
  bubble(Max, Tail, Acc, MaxResult).
bubblesort([], Acc, Acc).
bubblesort([Head|Tail], Acc, Sorted) :-
  bubble(Head, Tail, Bubble, Max),
  bubblesort(Bubble, [Max|Acc], Sorted).
bubblesort(List, Sorted) :- bubblesort(List, [], Sorted).
