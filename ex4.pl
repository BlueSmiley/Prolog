   word(astante,  a,s,t,a,n,t,e).
   word(astoria,  a,s,t,o,r,i,a).
   word(baratto,  b,a,r,a,t,t,o).
   word(cobalto,  c,o,b,a,l,t,o).
   word(pistola,  p,i,s,t,o,l,a).
   word(statale,  s,t,a,t,a,l,e).

   crossword(A,B,C,D,E,F) :- 
   word(A,_,M,_,N,_,O,_),
   word(B,_,P,_,Q,_,R,_),
   word(C,_,S,_,T,_,U,_),

   word(D,_,M,_,P,_,S,_),
   word(E,_,N,_,Q,_,T,_),
   word(F,_,O,_,R,_,U,_).