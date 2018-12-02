p(1).
p(2)  :-  !.
p(3). 

% 10.1
% predicted answers 
% X = 1, X=2

% X = 1, Y = 1
% X = 1, Y = 2
% X = 2, Y = 1
% X = 2, Y = 2.

% X = 1, Y = 1
% X = 1, Y = 2

% 10.2
% Tells of there's a positive,zero or negatove number of something in class
class(Number,positive)  :-  Number  >  0,!.
class(0,zero) :- !.
class(Number,negative)  :-  Number  <  0,!. 

%10.3 
split([],[],[]).
split([H|T],P,N) :- H >= 0, split(T,OldP,N), P = [H|OldP],!.
split([H|T],P,N) :- H < 0, split(T,P,OldN), N = [H|OldN],!.

%10.4
directTrain(saarbruecken,dudweiler).
directTrain(forbach,saarbruecken).
directTrain(freyming,forbach).
directTrain(stAvold,freyming).
directTrain(fahlquemont,stAvold).
directTrain(metz,fahlquemont).
directTrain(nancy,metz). 

route(X,Y,Route) :- route_h(X,Y,[],Route).
route_h(X,X,Visited,Route) :- reverse([X|Visited], Route).
route_h(X,Y,Visited,Route) :- 
    X \= Y, 
    directTrain(X,Z),
    \+ member(Z,Visited),
    route_h(Z,Y,[X|Visited],Route).
route_h(X,Y,Visited,Route) :- 
    X \= Y, 
    directTrain(Z,X),
    \+ member(Z,Visited),
    route_h(Z,Y,[X|Visited],Route).

%10.5
jealous(X,Y):-  loves(X,Z),  loves(Y,Z), X \= Y. 


