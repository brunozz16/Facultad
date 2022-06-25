%pertenece
miembro(X,[X|_]).
miembro(X,[_|R]):-miembro(X,R).

%concatena
concatenar([],L,L).
concatenar([X|L1],L2,[X|L3]):-concatenar(L1,L2,L3).

%inversa
inversa([],[]).
inversa([X|L1],L):-inversa(L1,Resto),concatenar(Resto,[X],L).

%1)FACTORIAL
factorial(0,1).
factorial(X,R):-X>0,Aux is X-1,factorial(Aux,R2),R is X*R2.

%2)CONTAR
contar(_,[],0).
contar(X,[L|R],Result):-X==L,contar(X,R,Aux),Result is Aux+1.
contar(X,[L|R],Result):-X\=L,contar(X,R,Aux),Result is Aux.

%3)CANTIDAD
cantidad([],0).
cantidad([_|R],Elementos):-cantidad(R,Suma),Elementos is Suma+1.

%4)SUMA
sumalista([],0).
sumalista([P|R],X):-sumalista(R,S),X is P+S.

%5)POSITIVOS
positivoslista([],[]).
positivoslista([X|Resto],L):-X>0,positivoslista(Resto,Y),concatenar([X],Y,L).
positivoslista([X|Resto],L):-X<0,positivoslista(Resto,L).

%6)SUMA LISTA
sumalista([],[],[]).
sumalista([C1|R1],[C2|R2],LS):-sumalista(R1,R2,LS2),concatenar([Suma],LS2,LS),Suma is C1+C2.

%7)ELIMINAR DUPLICADO
eliminar_elemento(_,[],[]).
eliminar_elemento(E,[E|R],Resultado):-eliminar_elemento(E,R,Resultado).
eliminar_elemento(E,[F|R],[F|Resultado]):- E \= F ,eliminar_elemento(E,R,Resultado).

eliminar_dup([],[]).
eliminar_dup([X|R],[X|Resultado]):-eliminar_elemento(X,R,Limpia), eliminar_dup(Limpia,Resultado).

%8)PROFUNDIDAD
profundidad([],0).
profundidad([_],1).
profundidad([I,_,D],Prof):-profundidad(I,IP),profundidad(D,DP),IP >= DP,Prof is IP+1.
profundidad([I,_,D],Prof):-profundidad(I,IP),profundidad(D,DP),IP < DP,Prof is DP+1.

%9)INSERTAR EN ORDEN
insertar(X,[],[X]).
insertar(X,[Y|Ys],[Y|Zs]):-X>Y,insertar(X,Ys,Zs).
insertar(X,[Y|Ys],[X,Y|Ys]):-X=<Y.

%10)ORDENAR ASCENDENTE
ordenar2([],[]).
ordenar2([X|Xs],Ys):-ordenar2(Xs,Zs),insertar(X,Zs,Ys).

%11)APLANAR
aplanar([],[]).
aplanar([X|C],L) :- not(X=[_|_]), !, aplanar(C,L1), concatenar([X],L1,L).
aplanar([X|C],L) :- aplanar(X,L1), aplanar(C,L2), concatenar(L1,L2,L).

%12)PERMUTACIONES EN LISTA
%a)...
%b)...
ins(X,L,[X|L]).
ins(X,[Y|L1],[Y|L2]):-ins(X,L1,L2).
per([],[]).
per([X|L],Lp):-per(L,L1),ins(X,L1,Lp).
