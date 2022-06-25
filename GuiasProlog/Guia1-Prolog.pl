espadre(leoncito,geronimo).
espadre(leoncito,alberto).
espadre(alberto,juan).
espadre(alberto,luis).
espadre(geronimo,luisa).
mismapersona(X,X).

eshermano(A,B):-espadre(C,A),espadre(C,B),not(mismapersona(A,B)).
esnieto(A,B):-espadre(C,A),espadre(B,C).
----------------------------------------------
EJERCICIO 1.
a) c
b) No existe
c) 2,3
d) #t
e) todas las listas
f) #f
g) todas, b
----------------------------------------------
EJERCICIO 2.
a) espadre(alberto,luis).
b) espadre(luis,alberto).
c) eshermano(X,luis).
d) esnieto(luisa,X).
e) esnieto(X,Y).
----------------------------------------------
EJERCICIO 3.
a) menu(X,Y,Z).
b) menu(X,Y,'Dulce de batata').
C) menu(X,'Locro',Z).
d) false
e) false
----------------------------------------------
EJERCICIO 4.
a) menu(X,'Locro',Z).
----------------------------------------------
EJERCICIO 5.
a) ruta(X,'cordoba').
b) ruta('parana',X).
c) false
d) combinacionruta(A,B):-ruta(A,C),ruta(C,B).   (true, false)
----------------------------------------------
EJERCICIO 6.
a)
planeta(Planeta):-orbita(Planeta,_),not(estrella(Planeta)),!.
luna(Luna):-orbita(_,Luna),not(planeta(Luna)).
lunade(Planeta,Luna):-orbita(Planeta,Luna),planeta(Planeta),luna(Luna).
b)
%No con los conocimientos adqueridos hasta el momento
----------------------------------------------
EJERCICIO 7.
menu('Bombones de jamón','Locro','Dulce de batata').
menu('Bombones de jamón', 'Locro', 'Alfajor norteño').
menu('Tarta de Atún', 'Atados de repollo', 'Dulce de batata').
menu('Tarta de Atún', 'Pollo romano con hierbas y vino', 'Flan').
menu('Volovanes de atún', 'Matambre con espinacas y parmesano', 'Torta moka').
menu('Buñuelos de bacalao', 'Pollo romano con hierbas y vino', 'Alfajor norteño').
entrada("omelete").
entrada("empanada").
principal("locro").
principal("guiso").
postre("flan").
postre("helado").

carta(Entrada,Principal,Postre):- entrada(Entrada),principal(Principal),not(postre(Postre)).

