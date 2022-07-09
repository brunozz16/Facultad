(define-struct posh (x y))
(define i (make-posh 4 2))
(define j (make-posh 3 2))
(define k (make-posh 5 3))
(define vectornull (make-posh 0 0))

"1)DISTANCIA 2 PUNTOS"
(define distancia-puntos
  (lambda (punto1 punto2)
      (sqrt (+ (expt (- (posh-x punto2) (posh-x punto1)) 2) (expt (- (posh-y punto2) (posh-y punto1)) 2)))
    )
  )
(distancia-puntos i j)

"2)CENTRO DE GRAVEDAD"
(define sumatoria
  (lambda (lista)
    (if (null? lista)
        '(0 0)
        (map + (list (posh-x (car lista)) (posh-y (car lista))) (sumatoria (cdr lista)))
     )
   )
 )
(define gravedad
  (lambda (lista)
    (let ((sumatorialista (sumatoria lista)) (largolista (length lista)))
      (/ (+ (car sumatorialista) (cadr sumatorialista)) largolista)
    )
  )
 )
(gravedad (list i j k))
"3)DISTANCIA MAXIMA"
(define dist-max
  (lambda (lista)
    (if (list? lista)
        (if (null? lista)
            vectornull
            ;...
        )
    "no es lista"
     )
   )
 )
(dist-max (list i j k))
"4)CUENTA .TXT"
(define o(open-input-file"Ejercicio4.txt"))
(define cuenta
  (lambda(archivo)
    (length (string->list(read-line archivo)))
    )
  )
(close-input-port o)
"5)MUESTRA"
(define i(open-input-file "Ejercicio4.txt"))
(define muestraarchivo
  (lambda (parametro)  
     (read-line parametro)   
   )
 )
  
(muestraarchivo i)
(close-input-port i)
"Ejercicio 6"
(define pesoRecursivo
  (lambda (ls)
    (if (null? ls)
        '()
        (cons (eval (cons + (map char->integer (string->list (car ls))))) (pesoRecursivo (cdr ls)))
        )
    ))
;(pesoRecursivo '("moto" "auto" "casa" "juego" "aire"))

; Wrapper para vincular cada palabra con su peso
(define listaPalabra
  (lambda (ls)
    (map cons ls (pesoRecursivo ls))
    ))
;(listaPalabra '("moto" "auto" "casa" "juego" "aire"))

;Funcion para insertar un elemento en una lista ordenada
(define insertar
  (lambda (e ls)
    (if (null? ls)
        (list e)
        (if (< (cdr e) (cdar ls))
            (cons e ls)
            (cons (car ls) (insertar e (cdr ls)))
            )
        )
    ))
;(insertar '("moto" . 447) '(("casa" . 408) ("auto" . 441) ("juego" . 538)))

(define ordenar_aux
  (lambda (l1 l2)
    (if (null? l1)
        l2
        (ordenar_aux (cdr l1) (insertar (car l1) l2))
        )
    ))
;(ordenar_aux '(("moto" . 447) ("auto" . 441) ("casa" . 408) ("moto" . 447) ("juego" . 538) ("aire" . 417) ("tomo" . 447)) '())

; Funcion para obtener las palabras de la lista impropia
(define palabras
  (lambda (ls)
    (if (null? ls)
        '()
        (cons (caar ls) (palabras (cdr ls))))))

; Funcion Principal
(define ordenar
  (lambda (ls)
    (if (null? ls)
        '()
        (palabras (ordenar_aux (listaPalabra ls) '())))))

(ordenar '("moto" "auto" "casa" "juego" "aire")) ;--> ("casa" "aire" "auto" "moto" "juego")

"Ejercicio 7"
(define fullreverse-list
  (lambda(lista)
    (if(empty? lista)
       '()
       (cons (fullreverse-list(cdr lista)) (list (car lista)))
    )
  ))

"Ejercicio 8"
(define app2list
  (lambda (elem1 elem2)
    (cond
      ((and (list? elem1) (list? elem2)) (concatena elem1 elem2))
      ((or (list? elem1) (list? elem2)) (cond
                                          ((list? elem1) (cons elem2 elem1))
                                          (else (cons elem2 elem1))
                                          ))
      (else (cons elem1 (cons elem2 '())))
      )
    )
  )
;add to exercise 8
(define concatena
  (lambda (list1 list2)
    (if(null? list1)
       list2
       (cons (car list1) (concatena (cdr list1) list2))
       )
    )
  )
  
(app2list '(3 6 7) 5)