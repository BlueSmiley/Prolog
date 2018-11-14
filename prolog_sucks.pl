% test add inputting numbers N1 and N2
testAdd(N1,N2,T1,T2,Sum,SumT) :- numb2pterm(N1,T1), numb2pterm(N2,T2),
add(T1,T2,SumT), pterm2numb(SumT,Sum).

% test mult inputting numbers N1 and N2
testMult(N1,N2,T1,T2,N1N2,T1T2) :- numb2pterm(N1,T1), numb2pterm(N2,T2),
mult(T1,T2,T1T2), pterm2numb(T1T2,N1N2).
% test revers inputting list L
testRev(L,Lr,T,Tr) :- ptermlist(T,L), revers(T,Tr), ptermlist(Tr,Lr).
% test normalize inputting list L
testNorm(L,T,Tn,Ln) :- ptermlist(T,L), normalize(T,Tn), ptermlist(Tn,Ln).
% make a pterm T from a number N    numb2term(+N,?T)
numb2pterm(0,f0(null)).
numb2pterm(N,T) :- N>0, M is N-1, numb2pterm(M,Temp), incr(Temp,T).
% make a number N from a pterm T  pterm2numb(+T,?N)
pterm2numb(null,0).
pterm2numb(f0(X),N) :- pterm2numb(X,M), N is 2*M.
pterm2numb(f1(X),N) :- pterm2numb(X,M), N is 2*M +1.
% reversible  ptermlist(T,L)
ptermlist(null,[]).
ptermlist(f0(X),[0|L]) :- ptermlist(X,L).
ptermlist(f1(X),[1|L]) :- ptermlist(X,L).



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

incR(X,Y) :- legal(X),increment(X,Y).

add(f0(null),X,X).
add(X,f0(null),X).
add(X,Y,Z) :- incR(A,X),incR(Y,B),add(A,B,Z),!.

mult(f0(null),_,f0(null)).
mult(_,f0(null),f0(null)).
mult(f1(null),X,X).
mult(X,Y,Z) :- incR(A,X),mult(A,Y,B),add(Y,B,Z),!.

revers(f1(null),f1(null)).
revers(f0(null),f0(null)).
revers(X,Y) :- funct(X,null,Y).

funct(null, Y,Y).
funct(f0(X),Z, Y) :- funct(X,f0(Z),Y).
funct(f1(X),Z, Y) :- funct(X,f1(Z),Y).

enc(f0(null), null).
enc(f1(null),f1(null)).
enc(f1(X),f1(Y)) :- X \= null, enc(X, Y).
enc(f0(X),f0(Y)) :- enc(X,Y), Y \= null.
enc(f0(X),null) :- enc(X,null).

normalize(null,f0(null)).
normalize(f0(null),f0(null)).
normalize(X,Y) :- X \= null, X \= f0(null), enc(X,Y).

incr(X,Y) :- increment(X,Y).

