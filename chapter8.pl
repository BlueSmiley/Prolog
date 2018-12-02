s  -->  np,vp.
   
np(X)  -->  det,n(X).

vp  -->  v(X),np(X).
vp  -->  v.

det  -->  [the].
det  -->  [a].

n  -->  [woman].
n(p) --> [men]
n(s)  -->  [man].
n(_)  -->  [apple].
n(_)  -->  [pear].

v(p) --> [eat]
v(s)  -->  [eats].
v --> [know].
