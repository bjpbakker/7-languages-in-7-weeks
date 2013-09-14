-module(client).
-export([start_translators/0]).
-export([translate/2]).

start_translators() ->
  doctor:start(fun spanish:loop/0, spanish),
  doctor:start(fun french:loop/0, french).

translate(Word, Language) ->
  print_translation(Word, Language,
    call(Language, Word)).

print_translation(Word, Language, Translation) ->
  io:format('~s in ~s is: ~s~n', [Word, Language, Translation]).

call(Pid, Msg) ->
  Pid ! {self(), Msg},
  receive
    Reply -> Reply
  end.
