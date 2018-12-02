strategy(X,Y,List) :- 
    string_codes(X,Z),
    compress(Z,A),Z \= A,
    string_codes(Y,A),
    List = [compress,Y].
strategy(X,Y,List) :- 
    string_codes(X,Z),
    proper_sublist(Z,A),
    Z \= A,
    string_codes(Y,A),
    List = [proper_sublist,Y].

compress([],[]).
compress([A,A|T],X) :- compress([A|T],X).
compress([A,B|T],X) :- A \= B, compress([B|T],Y), X = [A|Y].
compress([X],[X]).

sublist([_|T],X) :- sublist(T,X).
sublist([],[]).
sublist([H|T],X) :- sublist(T,Y),X = [H|Y].

proper_sublist(X,Y) :- psub_helper(X,Y).
proper_sublist([_|T],X) :- proper_sublist(T,X).

psub_helper([],[]).
psub_helper([H|T],X) :- psub_helper(T,Y), X = [H|Y].
psub_helper([H|R],[H]) :- R \= [].

solve(X,X,[]).
solve(X,Y,FilledTerms) :- strategy(X,Z,Term), solve(Z,Y,NextTerms), FilledTerms = [Term|NextTerms].
