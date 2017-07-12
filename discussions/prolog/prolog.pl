%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Prolog Lists
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% 1. Find the last element of a list
last([H], [H]) :- !.
last([_|T], X) :-
  last(T,X).

% 2. Find the kth element of a list
kth([H|_], 0, H) :- !.
kth([_|T], K, X) :-
  K1 is K - 1,
  kth(T, K1, X).

% 3. Find the number of elements of a list
len([], 0).
len([_|T], X) :-
  len(T,Y),
  X is Y + 1.

% 4. Reverse a list
rev([], []).
rev([H|T], X) :-
  rev(T, Y),
  append(Y, [H],X).

% 5. Concatenate a list
concat([],L2,L2).
concat([H|T],L2,[H1|T1]) :-
    H1 = H,
    concat(T,L2,T1).

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Prolog Arithmetic
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% 1. factorial(N,Factorial)
factorial(0,1) :- !.
factorial(N,F) :-
  N > 0,
  N1 is N - 1,
  factorial(N1,F1),
  F is N * F1.

% 2. Sum the numbers 1 to n
sumN(1, 1) :- !.
sumN(N, Sum) :-
  N > 0,
  N1 is N - 1,
  sumN(N1,S1),
  Sum is S1 + N.

% 3. Find x^n. power(X,N,R).
power(_,0,1) :- !.
power(X,N,R) :-
  N > 0,
  N1 is N - 1,
  power(X,N1,R1),
  R is R1 * X.
