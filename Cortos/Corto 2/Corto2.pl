
% Gerson Steven Majano Guandique 00064420 Seccion 1
% Noe Bladimir Alas Moscoso 00262020 Seccion 1


%Ejercicio_1

% Regla para calcular la ecuacion de la recta y almacenarla en la memoria
calcular_y_almacenar_ecuacion((X1, Y1), (X2, Y2)) :-
    M is (Y2 - Y1) / (X2 - X1),  % Calcular la pendiente (m)
    B is Y1 - M * X1,           % Calcular el termino independiente (b)
    assert(ecuacion_recta(M, B)). % Almacenar la ecuacion en la memoria

% Regla para evaluar la ecuacion de la recta en un valor de x y obtener el valor de y
evaluar_ecuacion_recta(X, Y) :-
    ecuacion_recta(M, B),   % Recuperar la ecuacion almacenada
    Y is M * X + B.         % Evaluar la ecuacion en x para obtener y


%Ejercicio_2
%
% Regla para crear una secuencia a partir de una lista de sublistas
crear_secuencia([], []).
crear_secuencia([[N, Char] | X], Y) :-
    repetir_caracter(N, Char, R),
    crear_secuencia(X, Resto_secuencia),
    append(R, Resto_secuencia, Y).

% Regla para repetir un caracter N veces
repetir_caracter(0, _, []).
repetir_caracter(N, Char, [Char | Resto]) :-
    N > 0,
    N1 is N - 1,
    repetir_caracter(N1, Char, Resto).




