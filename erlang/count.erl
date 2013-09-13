-module(count).
-export([to/1,down/1]).

to(N) ->
  Inc = fun(C) -> C + 1 end,
  count(1, N, Inc).
down(N) -> 
  Dec = fun(C) -> C - 1 end,
  count(N, 1, Dec).

count(N, N, _) -> print(N);
count(Current, Target, NextFun) ->
  print(Current), count(NextFun(Current), Target, NextFun).

print(N) -> io:format("~p~n", [N]).
