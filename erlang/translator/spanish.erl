-module(spanish).
-export([loop/0]).

loop() ->
  receive
    {Sender, 'house'} ->
      Sender ! 'casa',
      loop();
    {Sender, 'white'} ->
      Sender ! 'blanca',
      loop();
    {Sender, Unknown} ->
      Sender ! lists:concat(["I don't know this word: ", Unknown]),
      exit({dont_understand, Unknown, erlang:time()})
  end.

