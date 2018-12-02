:- dynamic sigmaRes/2.

% 11.1 -  
% q(a,b)
% q(1,2)
% q(foo,blug)

%  q(a,b)
% q(foo,blug)
% p(X) :- h(X)

% p(X) :- h(X)

%11.2
%[blug,,blag,blig] - Correct

%[blob,dang]  - Correct

%[blob,blob,blob,blaf,dang,dang,flab] - Correct

% Y = blug
% [blob,dang]
% Y = blag
% [blob,blaf]
% Y = blig
% [blob]
% Y = dong
% [dang]
% Y = blob
% [flab]

% but also repeats are included 
% - Wrong. First of all, the Y's are sorted. Secondy no repeats were there it was exact same
% as whats written up there but sorted. The difference comes when using ^ which merges the
% sublists into one list, bag of allows duplicates but set of doesnt. Set of also orders
% the result of ^.

% [blaf,blob,dang,flab]

sigma(1,1).
sigma(N,X) :- sigmaRes(N,X),!.
sigma(N,X) :- 
    \+ sigmaRes(N,X),!,
    N > 1, 
    M is N-1,sigma(M,Y), 
    X is Y + N,
    assert(sigmaRes(N,X)). 

q(blob,blug).
q(blob,blag).
q(blob,blig).
q(blaf,blag).
q(dang,dong).
q(dang,blug).
q(flab,blob). 

