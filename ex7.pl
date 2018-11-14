incr(null,f0(null)).
incr(f0(X), f1(X)).
incr(f1(X), f0(Y)) :- incr(X,Y).
