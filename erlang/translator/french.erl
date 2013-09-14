-module(french).
-export([loop/0]).

loop() ->
  receive
    {Sender, 'house'} ->
      Sender ! 'maison',
      loop();
    {Sender, 'white'} ->
      Sender ! 'blanc',
      loop();
    {Sender, Unknown} ->
      Sender ! lists:concat(["I don't know this word: ", Unknown]),
      exit({dont_understand, Unknown, erlang:time()})
  end.

