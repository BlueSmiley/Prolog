last([X],X).
last([_|T],X) :- last(T,X).

tail([_],Y,Y).
tail([H|T],Acc,Res) :- tail(T,[H|Acc],Res).

secondLast(X,Z) :- tail(X,[],[Z|_]).

kelem(0,[X|_],X).
kelem(K,[_|T],X) :- N is K-1, kelem(N,T,X).

reverse([H|T],Acc,Res) :- reverse(T,[H|Acc],Res).
reverse([],Y,Y).

palindrome(X) :- reverse(X,[],Y), X = Y.

flatten([],[]).
flatten([H|T],X) :- is_list(H),flatten(H,Z), flatten(T,Y),append(Z,Y,X).
flatten([H|T],X) :- \+ is_list(H),flatten(T,Y),append([H],Y,X).

compress([],[]).
compress([A,A|T],X) :- compress([A|T],X).
compress([A,B|T],X) :- A \= B, compress([B|T],Y), X = [A|Y].
compress([X],[X]).


