second(X,Y) :- Y = [_,X|_]. 
swap12(X,Y) :- X = [A,B|C], Y = [B,A|C].

tran(eins,one).
tran(zwei,two).
tran(drei,three).
tran(vier,four).
tran(fuenf,five).   
tran(sechs,six).
tran(sieben,seven).
tran(acht,eight).
tran(neun,nine).  

listtran([],[]).
listtran([A|C],[B|D])  :- tran(A,B), listtran(C,D).

twice([],[]).
twice([A|C],[A,A|B]) :- twice(C,B).

byCar(auckland,hamilton).
byCar(hamilton,raglan).
byCar(valmont,saarbruecken).
byCar(valmont,metz).
  
byTrain(metz,frankfurt).
byTrain(saarbruecken,frankfurt).
byTrain(metz,paris).
byTrain(saarbruecken,paris).
   
byPlane(frankfurt,bangkok).
byPlane(frankfurt,singapore).
byPlane(paris,losAngeles).
byPlane(bangkok,auckland).
byPlane(singapore,auckland).
byPlane(losAngeles,auckland). 

travel1(X,Y) :- byCar(X,Y);byTrain(X,Y);byPlane(X,Y).
travel(X,Y) :- travel1(X,Y).
travel(X,Y) :- travel1(X,Z), travel(Z,Y).

travel(X,Y,Z) :- travel1(X,Y), Z = go(X,Y).
travel(X,Y,P) :- travel1(X,Z), travel(Z,Y,K), P = go(X,Z,K).