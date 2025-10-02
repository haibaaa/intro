```prolog
% return count of elements in list

count([], 0).
count([H|T], N) :- count(T, Intermediate), N is 1 + Intermediate.
```

```prolog
% who is married to their boss

above(X, Y) :- boss(X, Y).
above(X, Y) :- boss(X, Under), above(Under, Y).

above(X, Y), married(X, Y).
```
