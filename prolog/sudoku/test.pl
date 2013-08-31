test(Summary, Predicate) :-
  atom_concat(Summary, ': ', Message),
  write(Message),
  call(Predicate),
  write('ok\n').

pending :-
  write('Not yet implemented\n'),
  false.

