%Gerson Steven Majano Guandique 00064420 Seccion 01

% Hechos para representar las fases de la metamorfosis de la rana
fase(huevo).
fase(embrion).
fase(renacuajo).
fase(renacuajo_dos_patas).
fase(renacuajo_cuatro_patas).
fase(rana_cola_corta).
fase(rana_adulta).

% Relación de aridad dos que representa las conversiones entre fases
convierte(huevo, embrion).
convierte(embrion, renacuajo).
convierte(renacuajo, renacuajo_dos_patas).
convierte(renacuajo_dos_patas, renacuajo_cuatro_patas).
convierte(renacuajo_cuatro_patas, rana_cola_corta).
convierte(rana_cola_corta, rana_adulta).

% Regla para mostrar las fases de metamorfosis que siguen a una fase dada
siguiente_fase(X):-

% Validación para asegurarse de que se proporciona un argumento
(nonvar(X) ->

   (fase(X) -> mostrar_fase_siguiente(X);

       write('Error: La fase introducida no existe.'), !, fail);

       write('Error: Debes agregar una fase como argumento.'), !, fail).

% Regla para indicar que no hay más fases
siguiente_fase(_):-

write('La rana no presenta más fases.'), nl.

% Regla para mostrar la siguiente fase
mostrar_fase_siguiente(X):-

write(X), write(' -> '),

convierte(X, Y),

writeln(Y),

% Llamar a la regla anterior para encontrar más fases (usamosrecursividad)
    siguiente_fase(Y).
