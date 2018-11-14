%legal(f0(null)).
%legal(f1(null)).
%legal(f0(X)) :- legal(X),X \= f0(null).
%legal(f1(X)) :- legal(X).

%S -> 0
%S -> 1
%S -> 1T
%T -> 0T|1T

%legal(f0(null)).
%legal(f1(X)) :- legal(f0(X)).
%legal(f0(X)) :- legal(X).



%0
%1
%01
%11
%001
%101
%011
% when incrementing f0(X), swap the innermost 0

incr(f0(null),f1(null)). %base rule incrementing 0 goes to 1
incr(f1(X), f0(Y)) :- incr(X,Y).
incr(f0(X), f1(X)) :- incr(X,f0(X)). 
% increment f0(X) to f1(X) if derivable from base








