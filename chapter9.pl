%9.1
% yes.  ---Correct
% yes.  --  Correct
% yes.  --- Wrong it's false
% yes.  --- Wrong it's false
% no.   --- Wrong it's true
% yes.  --- Correct
% yes   --- Correct
% no.   --- Correct
% yes.  --- Correct
% yes.  --- Correct
% yes.  --- Correct
% no.   --- Correct but prolog suicides not just a no.
% no.   --- Correct
% yes yes. --- Correct reponds VAR = vincent

%9.2
% yes.  -Correct
% yes.  -Correct
% X = [[a],[b],[c]] -Correct
% no.   -Correct
% note in swi prolog the canoncial rep of lists is '[|]'
% Including the quotation marks

%9.3
termtype(X,atom) :- atom(X).
termtype(X,number) :- number(X).
termtype(X,constant) :- atomic(X).
termtype(X,variable) :- var(X).
termtype(X,simpleterm) :- atomic(X) ; var(X).
termtype(X,complexterm) :- \+ atomic(X), \+ var(X).
termtype(_,term).

groundlist([]).
groundlist([H|T]) :- groundterm(H), groundlist(T). 

groundterm(X) :- nonvar(X), functor(X,_,0).
groundterm(X) :- nonvar(X),'=..'(X,[_|Y]),Y \== [], groundlist(Y),!.

%9.5
% I think the way it works is that if xfy then it's bracketed such that on the right there could be
% operators of the same or less precedence but none in the left. As x imples ess than and y =<
% well formed. operators: is a . is_a(X,witch). --correct

%  and( harry, and(ron, are(hermione, friends) ) )  --correct but wrong bracketing
%       are has higher precedence so ans = ((harry and (ron and hermione)) are friends)
% higher precedence = evaluated later 

%  and( is_a(harry,wizard), likes(quidditch))   --wrong clash between 'is a' and 'likes'

%  malformed is_a(dumbledore, famous) wizard    --wrong runs fine
%   ans = (dumbledore is_a (famous wizard)).

:-  op(300,  xfx,  [are,  is_a]).
:-  op(300,  fx,  likes).
:-  op(200,  xfy,  and).
:-  op(100,  fy,  famous). 

is_a(_,_).
are(_,_).
likes(_).
and(_,_).
famous(_).
