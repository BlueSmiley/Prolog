mkList(0,[]).
mkList(X,[X|Z]) :- X \=0,Y is X-1,mkList(Y,Z).

gtList([H|_],H).
gtList([_|Tail],R) :- gtList(Tail,R).


s(0) --> [].
s(X) --> {mkList(X,List)},{gtList(List,Res)},{Y is X-Res},[Res],s(Y). 
