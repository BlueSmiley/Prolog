increment(null,_) :- false.
increment(f0(null), f1(null)).
increment(f1(null), f0(f1(null))).
increment(f0(X), f1(X)) :- X \= null.
increment(f1(X), f0(Y)) :- base(X), increment(X,Y).

base(f1(null)).
base(f0(null)) :- false.
base(f1(X)) :- X \= null, base(X).
base(f0(X)) :- X \= null, base(X).

%dont change anything above this line... it all should work
legal(f0(null)).
legal(X) :- legal(Y),increment(Y,X).
%wut...this is broken but works for the question
%This works but is broken for the question
%legal(X) :- increment(Y,X),legal(Y).
