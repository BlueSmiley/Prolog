:- dynamic
    cacheHit/2.
cleanup_db :-
      retractall(cacheHit(_,_)).


% N sets, K way associativity and L bits per line
cache(8,1,16).
cache(4,2,16).
cache(2,4,16).
cache(1,8,16).

wordsize(4).


% Takes in an address number of sets and line length. Returns the setnumber and tag
extract(Address,N,L,SetNo,Tag) :-
    wordsize(WORDSIZE),
    Offset_len is L/WORDSIZE, 
    bruteLog2(N,1,Setno_len),
    RemAddr is Address >> Offset_len,
    SetNo is RemAddr /\ 0xF,
    Tag is RemAddr >> Setno_len.

% bruteforce algorithm to calculate log 2(N)
bruteLog2(N,Acc,0) :- Acc >= N.
bruteLog2(N,Acc,Len) :- Acc < N, NewAcc is Acc*2, bruteLog2(N,NewAcc,NewLen),Len is NewLen + 1.

% Checks a cache for a hit
cacheCheck(SetNumber,_,Tag,1) :- 
    cacheHit(SetNumber,Tag),
    retract(cacheHit(SetNumber,Tag)),
    assertz(cacheHit(SetNumber,Tag)).

cacheCheck(SetNumber,K,Tag,0) :- 
    \+ cacheHit(SetNumber,Tag),
    lruRemove(SetNumber,K),
    !,% neccesary as of course if we backtrack we can find a new lru value
    assertz(cacheHit(SetNumber,Tag)).

% Removes the lru cache in the set if the number of caches greater than K
lruRemove(SetNumber,K) :- 
    findall(_,cacheHit(SetNumber,_),List),
    length(List,Length),
    Length < K.

lruRemove(SetNumber,K) :- 
    findall(_,cacheHit(SetNumber,_),List),
    length(List,Length),
    Length >= K,
    retract(cacheHit(SetNumber,_)).

cacheFeeder([H|T],N,K,L,Hits) :- 
    extract(H,N,L,SetNo,Tag),
    cacheCheck(SetNo,K,Tag,Res),
    cacheFeeder(T,N,K,L,PrevHits),
    Hits is PrevHits + Res.
cacheFeeder([],_,_,_,0).

testClean(AddressList,N,K,L,Hits) :- cleanup_db,cacheFeeder(AddressList,N,K,L,Hits),!.

feedAndClean(AddressList,Hits) :- cache(N,K,L),cleanup_db,cacheFeeder(AddressList,N,K,L,Hits).

main(Hits) :- feedAndClean(
    [0x0000,0x0004,0x000c,0x2200,0x00d0,0x00e0,0x1130,0x0028,
	0x113c,0x2204,0x0010,0x0020,0x0004,0x0040,0x2208,0x0008,
	0x00a0,0x0004,0x1104,0x0028,0x000c,0x0084,0x000c,0x3390,
	0x00b0,0x1100,0x0028,0x0064,0x0070,0x00d0,0x0008,0x3394],
    Hits).



