-module(doctor).
-export([start/2, loop/2]).

start(Fun, Register) ->
  Doc = spawn(doctor, loop, [Fun, Register]),
  Doc ! new,
  Doc.

loop(Fun, Register) ->
  process_flag(trap_exit, true),
  receive
    new ->
      io:format('creating and monitoring process ~p~n', [Register]),
      register(Register, spawn_link(Fun)),
      loop(Fun, Register);
    {'EXIT', From, Reason} ->
      io:format('process ~p ~p died because of ~p~n', [Register, From, Reason]),
      self() ! new,
      loop(Fun, Register)
  end.
