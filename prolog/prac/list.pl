member([H|_], H).
member([_|T], X) :- member(T, X).

last([X], X).
last([_|T], X) :- last(T, X).

append([], L2, L2).
append([H|T1], L2, [H|T3]) :- append(T1, L2, T3).

len([], 0).
len([_|Xs], N) :- N > 0, M is N-1, len(Xs, M).

add(z, B, B).
add(s(A), B, s(S)) :- add(A, B, S).
