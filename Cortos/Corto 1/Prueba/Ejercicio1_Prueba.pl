%Ejer1
calcular(A):-
A is (8* /(8,^(4,2))+6).

%Ejer3 arbol

padre(manuel,mario).
padre(manuel,ligia).
padre(mario,marina).
padre(mario,jaime).
padre(mario,carlos).
padre(julio,regina).
padre(julio,jacinta).

madre(josefina,mario).
madre(josefina,ligia).
madre(silvila,marina).
madre(silvia,jaime).
madre(silvia,carlos).
madre(ligia,regina).
madre(ligia,jacinta).

abuela(X,Y):-
madre(X,Z),
padre(Z,Y).
