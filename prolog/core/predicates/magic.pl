magicNumber(7).
magicNumber(4).
magicNumber(69).

nearby(X, Y) :- nonvar(X), X = Y.
nearby(X, Y) :- nonvar(X), Y is X + 1.
nearby(X, Y) :- nonvar(X), Y is X - 1.
nearby(X, Y) :- var(X), nonvar(Y), nearby(Y, X).
