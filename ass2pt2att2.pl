s --> s0(0,0,0,0,0,0,0,0,0).
s0(1,1,1,1,1,1,1,1,1) --> [].
s0(A,B,C,D,E,F,G,H,I) --> col(A,B,C,X,Y,Z),s1(X,Y,Z,D,E,F,G,H,I).
s1(A,B,C,D,E,F,G,H,I) --> nat(D,E,F,X,Y,Z),s2(A,B,C,X,Y,Z,G,H,I).
s2(A,B,C,D,E,F,G,H,I) --> pet(G,H,I,X,Y,Z),s0(A,B,C,D,E,F,X,Y,Z).
col(0,B,C,1,B,C) --> [red].
col(A,0,C,A,1,C) --> [blue].
col(A,B,0,A,B,1) --> [green].
nat(0,B,C,1,B,C) --> [english].
nat(A,0,C,A,1,C) --> [spanish].
nat(A,B,0,A,B,1) --> [japanese].
pet(0,B,C,1,B,C) --> [jaguar].
pet(A,0,C,A,1,C) --> [snail].
pet(A,B,0,A,B,1) --> [zebra].

% Controller of entire grammar structure
z --> pred(col,[red,green,blue],X), pred(nat,[japanese,spanish,english],Y), pred(pet,[jaguar,snail,zebra],Z),
	  pred(col,X,A),pred(nat,Y,B),pred(pet,Z,C),
	  pred(col,A,[]),pred(nat,B,[]),pred(pet,C,[]).

%Consume only if valid unit. Else iterate through list
pred(A,[X|T], T) --> {lex(A,X)},[X].
pred(A,[H|T],[H|X]) --> pred(A,T,X).

%lexicon
lex(col, red).
lex(col, blue).
lex(col, green).

lex(nat, english).
lex(nat, spanish).
lex(nat, japanese).

lex(pet, jaguar).
lex(pet, snail).
lex(pet, zebra).