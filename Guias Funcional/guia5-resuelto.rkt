(display "Ejercicio 1:")
(define concatena
  (lambda (l1 l2)
    (if(null? l1)
       l2
       (cons (car l1) (concatena (cdr l1) l2))
       )
    )
  )
(define inversa
  (lambda(lista)
    (if(list? lista)
       (if(null? lista)
          '()
          (if(list? (car lista))
             (inversa (car lista))
             (concatena (inversa(cdr lista)) (list (car lista)))
          )
       )
       lista
    )
    )
  )
(define concat-inv
  (lambda(l1 l2)
    (concatena l1 (inversa l2))
    )
  )
(concat-inv '(1 2 3) '(4 5 6))
(display "Ejercicio 2:")
(define pertenece
  (lambda(num l1 l2)
    (if(and (pertenece-wrapper num l1) (pertenece-wrapper num l2))
       true
       false
       )
    )
  )
(define pertenece-wrapper
  (lambda (num l1)
    (if(null? l1)
       false
       (if(eqv? (car l1) num)
          true
          (pertenece-wrapper num (cdr l1))
       )   
     )
   )
)
(pertenece 3 '(8 4 3 1)'(8 7 3 1))

(display "Ejercicio 3:")
(define cant-izq
  (lambda (atomo lista)
    (cant-izq-wrapper atomo lista 0)
    )
  )
(define cant-izq-wrapper
  (lambda (atomo lista contador)
    (if(null? lista)
       "el atomo no esta en la lista"
       (if(eqv? (car lista) atomo)
           contador
           (cant-izq-wrapper atomo (cdr lista) (+ contador 1))
           )
       )
    )
 )
(cant-izq 'd '(a b c d e f))
(display "Ejercicio 4:")
(define pertenece
  (lambda (lista elemento)
    (if(null? lista)
       #f
       (if(car (map (lambda(x) (eqv? elemento x)) lista))
          #t
          (pertenece (cdr lista) elemento)
          )
       )
    )
  )
       
(define addif
  (lambda (elemento lista)
    (if(pertenece lista elemento)
       lista
       (cons elemento lista)
       )
    )
  )
(addif 'a '(b c d))
(display "Ejercicio 5:")
(define validadias
  (lambda (mes dia)
    (cond
      ((or (eqv? mes 1) (eqv? mes 3) (eqv? mes 5) (eqv? mes 7) (eqv? mes 8) (eqv? mes 10) (eqv? mes 12)) (cond
                      ((or (> dia 31) (< dia 1)) #f)
                      (else #t)))
       ((eqv? mes 2) (cond
                      ((or (> dia 28) (< dia 1)) #f)
                      (else #t)))
       ((or (eqv? mes 4) (eqv? mes 6) (eqv? mes 9) (eqv? mes 11)) (cond
                      ((or (> dia 30) (< dia 1)) #f)
                      (else #t)))
       )
    )
  )
  
(define FECHAP
  (lambda (dia mes anio)
    (if (< anio 0)
        #f
        (if(or (< mes 0) (> mes 12))
           #f
           (if(validadias mes dia)
              #t
              #f
            )
           )
        )
    )
  )
(FECHAP 31 30 1876)
(display "Ejercicio 6:")
(define get-profundidad-x
  (lambda (arbol)
    (get-profundidad-wrapper arbol 0)
    )
  )
(define get-profundidad-wrapper
  (lambda (arbol contador)
    (if (or (null? arbol) (number? arbol))
       1
        (if (list? (car arbol))
            (+ 1 (get-profundidad-wrapper (car arbol) contador))
            (get-profundidad-wrapper (cdr arbol) contador)
            )
        )
    )
  )
(define mayor
  (lambda (lista candidato)
    (if(null? lista)
       candidato
       (if(> (car lista) candidato)
          (mayor (cdr lista) (car lista))
          (mayor (cdr lista) candidato)
          )
       )
    )
  )
(define get-profundidad
  (lambda(lista)
    (mayor (map (lambda(x) (get-profundidad-x x)) lista) -1)
    )
  )
(get-profundidad '((1 (2)) (((5 7))) 4))
(display "Ejercicio 7:")
(define CONCATENA
  (lambda (lista1 lista2)
    (if (null? lista1)
       lista2
       (cons (car lista1) (CONCATENA (cdr lista1) lista2))
    )
  )
)
(define APLANAR-wrapper
  (lambda (l1)
    (if(null? l1)
       '()
       (cond
         ((list? (car l1))
          (APLANAR-wrapper (car l1)))
         (else
          (cons (car l1) (APLANAR-wrapper (cdr l1))))
       )
    )
  )
)
(define APLANAR-ayuda
  (lambda (y)
    (map (lambda(x) (APLANAR-wrapper x)) y)      
  )
)
(define concatenaar
  (lambda (x)
    (if (null? (cdr x))
        (CONCATENA (car x) '())
        (CONCATENA (car x) (concatenaar (cdr x)))
        )
    )
  )
(define APLANAR
  (lambda(x)
    (concatenaar (APLANAR-ayuda x))
  )
)
(APLANAR '((1 2 3) (9 (2 3 4)) ((((3 4 (7)))))))
(display "Ejercicio 8:")
(define ultimo-elemento
  (lambda (lista)
    (if(null? (cdr lista))
       (car lista)
       (ultimo-elemento (cdr lista))
       )
    )
  )    
(define super-car
  (lambda(l1)
    (if (null? (cdr l1))
        (cdr l1)
       (cons (car l1) (super-car(cdr l1)))
    )
  )
)

(define rotar
  (lambda (direccion lista)
    (cond
      ((equal? direccion 'izquierda) (CONCATENA (cdr lista) (list (car lista))))
      ((equal? direccion 'derecha) (cons (ultimo-elemento lista) (super-car lista)))
      (else "la direccion solo puede ser derecha o izquierda")
    )
  )
)
(rotar 'derecha '(1 2 3 4))
(display "Ejercicio 9 con map:")
;Con map
(define calcula-cuadrados
  (lambda(x)
    (map (lambda(y) (* y y)) x)
    )
  )
(calcula-cuadrados '(1 2 3 4))
(display "Ejercicio 9 sin map:")
;Sin map
(define calcula-cuadrados-x
  (lambda (x)
    (if (null? x)
        '()
        (cons (* (car x) (car x)) (calcula-cuadrados-x (cdr x)))
        )
    )
  )
(calcula-cuadrados-x '(1 2 3 4))
(display "Ejercicio 10:")
(define reversa-lista
  (lambda (lista resto)
    (if(null? lista)
       resto
       (reversa-lista (cdr lista) (cons (car lista) resto))
    )
  )
)
(define resta-listas-wrapper
  (lambda (l1 l2 resto)
    (if(null? l1)
       (reversa-lista resto '())
       (if (pertenece l2 (car l1))
           (resta-listas-wrapper (cdr l1) l2 resto)
           (resta-listas-wrapper (cdr l1) l2 (cons (car l1) resto))
        )
    )
  )
)
(define resta-listas
  (lambda(l1 l2)
    (resta-listas-wrapper l1 l2 '())
  )
)

(resta-listas '(1 2 3 4) '(2 3))
(display "Ejercicio 11:")
;--------------Algoritmo para ordenar una lista--------------
(define eliminar
  (lambda (n lista)
    (cond
      [(empty? lista) empty]
      [(eqv? n (car lista)) (cdr lista)]
      [else (cons (car lista) (eliminar n (cdr lista)))])))
(define menor
  (lambda (lista)
    (cond
      [(empty? lista) empty]
      [(empty? (cdr lista)) (car lista)]
      [(< (car lista) (cadr lista)) (menor (cons (car lista) (cddr lista)))]
      [else (menor (cdr lista))])))
(define ordenar
  (lambda (lista)
    (cond
      [(empty? lista) empty]
      [else (cons (menor lista) (ordenar (eliminar (menor lista) lista)))])))

;(ordenar listaPrueba)
;---------------------------------------------------------------

(define suma-listas
  (lambda (l1 l2)
    (if(null? l1)
       l2
       (if(pertenece l2 (car l1)); → Pertenece previamente creada (recibe la lista y el elemento)
          (suma-listas (cdr l1) l2)
          (cons (car l1) (suma-listas (cdr l1) l2))
       )
    )
  )
)       
(ordenar (suma-listas '(1 2 3 4) '(2 3 5)))   
;(suma-listas '(1 2 3 4) '(2 3 5)) → (1 2 3 4 5)
(display "Ejercicio 12:")
(define altura
  (lambda(l)
    (if(null? l)
       0
       (if(null? (cdr l))
          1
          (let((izq (altura (cadr l)))
               (der (altura (caddr l))))
               (if(> izq der)
                  (+ 1 izq)
                  (+ 1 der)
               )
          )
      )
    )
  )
)
"Probar con binario completo, está mal el del ejemplo"



