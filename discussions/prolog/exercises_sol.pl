length([],0).
length([H|T],X) :-
  length(T,X1),
  X is X1 + 1.

reverse([],[]).

reverse([H|T],L) :-
  reverse(T,L1),
  append(L1,[H],L).

dupli([],[]).

dupli([H|T],[H,H|T1]) :-
  dupli(T,T1).

split(L,0,[],L).

split([H|T],N,[H|L1],L2) :-
  N > 0,
  N1 is N - 1,
  split(T,N1,L1,L2).

split(L,N,L1,L2) :-
  append(L1,L2,L),
  length(L1,N).

rotate(L,N,X) :-
  N >= 0,
  split(L,N,L1,L2),
  append(L2,L1,X).

rotate(L,N,X) :-
  N < 0,
  length(L,Y),
  N1 is Y + N,
  split(L,N1,L1,L2),
  append(L2,L1,X).

compress([],[]).
compress([H],[H]).

compress([H,H|T],L1) :-
  compress([H|T],L1).

compress([H,H1|T],[H|L1]) :-
  \+ H = H1,
  compress([H1|T],L1).

combination(0,L,[]).

combination(N,[H|T],[H|L]) :-
  N > 0,
  N1 is N - 1,
  combination(N1,T,L).

combination(N,[H|T],L) :-
    N > 0,
    combination(N,T,L).
