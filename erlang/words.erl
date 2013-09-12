-module(words).
-export([count/1,collect/1]).

count([]) -> 0;
count(Text) -> length(collect(Text)).

collect(Text) -> collect(Text, []).
collect(Text, Acc) ->
  case next_word_boundary(Text, 0) of
    -1 -> append_word(Acc, Text);
    WordBoundary ->
      {Word, Rest} = split(Text, WordBoundary),
      collect(Rest, append_word(Acc, Word))
  end.

split(Text, At) -> {take(At, Text), drop(At + 1, Text)}.

next_word_boundary([$\ |_], Index) when Index > 0 -> Index;
next_word_boundary([], _) -> -1;
next_word_boundary([_|Tail], Index) -> next_word_boundary(Tail, Index + 1).

append_word([], Word) -> [Word];
append_word([Head|Tail], Word) ->
  [Head|append_word(Tail, Word)].

take(0, _) -> [];
take(N, [Head|Tail]) when N =< length(Tail) + 1 ->
  [Head|take(N - 1, Tail)].

drop(0, List) -> List;
drop(N, [_|Tail]) when N =< length(Tail) + 1 ->
  drop(N - 1, Tail).

