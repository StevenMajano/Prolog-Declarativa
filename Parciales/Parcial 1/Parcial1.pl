
%Noe Bladimir Alas Moscoso 00262020
%Gerson Steven Majano Guandique 00064420

%Lugares de la casa
lugar(calle).
lugar(cochera).
lugar(sala).
lugar(cuarto_estudio).
lugar(cocina).
lugar(comedor).
lugar(lavadero).
lugar(bano).
lugar(cuarto_rodri).
lugar(cuarto_papas).
lugar(jardin).
lugar(quiosco).

conecta_con(calle,cochera).
conecta_con(cochera,calle).
conecta_con(cochera,sala).
conecta_con(sala,cochera).
conecta_con(sala,cuarto_estudio).
conecta_con(cuarto_estudio,sala).
conecta_con(sala,pasillo1).
conecta_con(pasillo1,sala).
conecta_con(cuarto_estudio,pasillo1).
conecta_con(pasillo1,cuarto_estudio).
conecta_con(comedor, pasillo1).
conecta_con(pasillo1,comedor).
conecta_con(cocina, pasillo1).
conecta_con(pasillo1,cocina).
conecta_con(cocina, lavadero).
conecta_con(lavadero, cocina).
conecta_con(pasillo1,pasillo2).
conecta_con(pasillo2,pasillo1).
conecta_con(bano, pasillo2).
conecta_con(pasillo2,bano).
conecta_con(pasillo2,cuarto_papas).
conecta_con(cuarto_papas,pasillo2).
conecta_con(cuarto_rodri,pasillo2).
conecta_con(pasillo2,cuarto_rodri).
conecta_con(jardin,pasillo2).
conecta_con(pasillo2,jardin).
conecta_con(lavadero,jardin).
conecta_con(jardin,lavadero).
conecta_con(jardin,quiosco).
conecta_con(quiosco,jardin).

ir_hacia(X, Y):-
    abolish(eslabon, 1),
    assert(eslabon(X)),
    desea_ir(X, Y),
    writeln(X).

desea_ir(X, Y):-
    conecta_con(X, Y),
    writeln(Y),
    assert(eslabon(Y)),
    !.

desea_ir(X, _):-
    conecta_con(X, Z),
    eslabon(Z),
    fail.

desea_ir(X, Y):-
    conecta_con(X, Z),
    not(eslabon(Z)),
    assert(eslabon(Z)),
    desea_ir(Z, Y),
    writeln(Z),
    !.

%Ejercicio2 ASIMO

%Objetos
objeto(pantuflas).
objeto(flores).
objeto(pisto).
objeto(agua).
objeto(limones).
objeto(papel_higienico).
objeto(revista).

%relaciones
esta_en(pantuflas, cuarto_rodri).
esta_en(pantuflas, sala).
esta_en(flores, jardin).
esta_en(pisto, cuarto_papas).
esta_en(papel_higienico, bano).
esta_en(agua,cocina).
esta_en(limones, jardin).
esta_en(revista, quiosco).

traer(Origen, Objeto) :-
    lugar(Origen),
    objeto(Objeto),
    encontrar_destino(Objeto, Destino),
    ir_hacia(Origen, Destino),
    writeln("-----------------------"),
    ir_hacia(Destino, Origen).

traer(Origen, _) :-
    not(lugar(Origen)),
    write('Ese lugar no pertenece a la casa.'), nl.

traer(_, Objeto) :-
    not(objeto(Objeto)),
    write('No se encuentra ese objeto en la casa.'), nl.

encontrar_destino(Objeto, Destino) :-
    esta_en(Objeto, Destino).

encontrar_destino(Objeto, Destino) :-
    objeto(Objeto),
    not(esta_en(Objeto, Destino)),
    write('No se sabe d�nde est� ese objeto en la casa.'), nl.




