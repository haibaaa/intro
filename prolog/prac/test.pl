% Prolog Comprehensive Study Guide - Exhaustive Test File

% --- Main Topic 1: Introduction to Prolog ---

% Facts defining a family tree
parent(tom, bob).
parent(tom, liz).
parent(bob, ann).
parent(bob, pat).
parent(pat, jim).

% People for human/mortal example
human(socrates).
human(plato).

% --- Main Topic 2: Syntax Fundamentals ---

% Example facts with constants and variables
name(john).
age(john, 25).

% --- Main Topic 3: Facts and Predicates ---

eats(fred, oranges).
eats(fred, apples).
eats(tony, apples).

likes(fred, food).
likes(tony, food).

color(red).
color(green).
color(blue).

num(1).
num(2).
num(3).

letter(a).
letter(b).

% --- Main Topic 5: Rules and Logical Implication ---

mortal(X) :- human(X).

grandparent(X, Y) :- parent(X, Z), parent(Z, Y).

% Sibling: X and Y share a parent and are distinct
sibling(X, Y) :- parent(P, X), parent(P, Y), X \= Y.

ancestor(X, Y) :- parent(X, Y).
ancestor(X, Y) :- parent(X, Z), ancestor(Z, Y).

% --- Main Topic 6: Queries and Goal Conjunction ---

% (No extra code needed here; conjunctions work with existing predicates)

% --- Main Topic 8: Recursion ---

count([], 0).
count([_|T], N) :- count(T, N1), N is N1 + 1.

directly_above(a, b).
directly_above(b, c).
directly_above(c, d).

above(X, Y) :- directly_above(X, Y).
above(X, Y) :- directly_above(X, Z), above(Z, Y).

% --- Main Topic 10: Complex Terms and Lists ---

point(3, 4).
point(0, 0).

date(2025, october, 2).

person(name(john, smith), age(30), occupation(engineer)).

node(value(5), left(node(value(3), nil, nil)), right(nil)).

first([X|_], X).
has_two([_, _|_]).
second([_, X|_], X).

% --- Main Topic 11: Unification ---

% (No predicates needed, queries run against existing facts and structures)

% --- Main Topic 12: Backtracking ---

same(X, X).

% --- Practice Problem Predicates ---

% List membership
member(X, [X|_]).
member(X, [_|T]) :- member(X, T).

% Last element in list
last(X, [X]).
last(X, [_|T]) :- last(X, T).

% Append lists
append([], L, L).
append([H|T1], L2, [H|T3]) :- append(T1, L2, T3).

% Prefix predicate
prefix([], _).
prefix([H|T1], [H|T2]) :- prefix(T1, T2).

% Sibling with ordering to avoid duplicates
sibling_nodup(X, Y) :- parent(P, X), parent(P, Y), X @< Y.

% Accumulator pattern for reverse
reverse_acc(List, Reversed) :- reverse_acc(List, [], Reversed).
reverse_acc([], Acc, Acc).
reverse_acc([H|T], Acc, Result) :- reverse_acc(T, [H|Acc], Result).

% Between predicate for pythagorean triples (built-in, but included for clarity)
between(Low, High, Low) :- Low =< High.
between(Low, High, X) :-
    Low < High,
    Low1 is Low + 1,
    between(Low1, High, X).

% Pythagorean triple generator
pythag(A, B, C) :-
    between(1, 20, A),
    between(A, 20, B),
    between(B, 20, C),
    C*C =:= A*A + B*B.

% Difference list append
append_dl(A-B, B-C, A-C).

% --- Common List Operations ---

length_tr(L, N) :- length_tr(L, 0, N).
length_tr([], N, N).
length_tr([_|T], Acc, N) :- Acc1 is Acc + 1, length_tr(T, Acc1, N).

sum([], 0).
sum([H|T], S) :- sum(T, S1), S is S1 + H.

sum_tr(L, S) :- sum_tr(L, 0, S).
sum_tr([], Acc, Acc).
sum_tr([H|T], Acc, S) :- Acc1 is Acc + H, sum_tr(T, Acc1, S).

max_list([X], X).
max_list([H|T], Max) :-
    max_list(T, MaxT),
    (H > MaxT -> Max = H ; Max = MaxT).

filter(_, [], []).
filter(Pred, [H|T], [H|Filtered]) :-
    call(Pred, H),
    filter(Pred, T, Filtered).
filter(Pred, [H|T], Filtered) :-
    \+ call(Pred, H),
    filter(Pred, T, Filtered).

positive(X) :- X > 0.

% --- Employee facts for relational examples ---

employee(john, 50000, sales).
employee(mary, 60000, engineering).
employee(bob, 55000, sales).

manager(alice, sales).

high_earner(X) :- employee(X, S, _), S > 55000.
high_earner(X) :- executive(X, _, _). % executive not defined here, so will not generate solutions

% --- Debugging ---

% Usage: ?- trace. for debugging

% --- Built-in predicate examples ---
% Usage queries:
% ?- X is 2 + 3.
% ?- 2 + 3 =:= 5.
% ?- atom(hello).
% ?- number(42).
% ?- is_list([1,2,3]).

% --- Cut example for determinism ---

max(X, Y, X) :- X >= Y, !.
max(X, Y, Y).

% --- Additional utility predicates (common patterns) ---

% Check if a list has at least two elements
has_two([_, _|_]).

% Check if an element is first
first_element([X|_], X).

% Check if list is empty
is_empty([]).

% --- End of test.pl ---
