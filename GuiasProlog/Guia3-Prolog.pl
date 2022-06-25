%Ejercicio 1
factorial(0, 1):-!.
factorial(Numero, Factorial):-Numero>0,NumeroAnt is Numero-1,factorial(NumeroAnt,FactorialAnt),Factorial is Numero*FactorialAnt.
%Ejercicio 2
p(1).
p(2):-!.
p(3).
% p(X)        ---> X=1        --->X=2
% p(X),p(Y)   ---> X=1,Y=1    --->X=1,Y=2    --->X=2,Y=1    --->X=2,Y=2
% p(X),!,p(Y) ---> X=1,Y=1    --->X=1,Y=2
%Ejercicio 3
eliminar_primero([],_,[]):-!.
eliminar_primero([C|R],X,Resultado):-C\=X,eliminar_primero(R,X,Aux),append([C],Aux,Resultado).
eliminar_primero([X|R],X,R):-!.
%Ejercicio 4
pertenece(_,[]):-false.
pertenece(E,[C|R]):-E\=C,pertenece(E,R),!.
pertenece(E,[E|_]).

agregar_nuevo(_,[],[]).
agregar_nuevo(E,List,L):-pertenece(E,List),append([],List,L),!.
agregar_nuevo(E,List,L):-not(pertenece(E,List)),append(List,[E],L).
%Ejercicio 5
semejanza([],[],0).
semejanza([X|R1],[X|R2],S):-semejanza(R1,R2,SumaAux),S is SumaAux+1,!.
semejanza([X|R1],[Y|R2],S):-X\=Y,semejanza(R1,R2,SumaAux),S is SumaAux-1.