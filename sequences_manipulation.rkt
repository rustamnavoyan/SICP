#lang sicp

(cons 1 (cons 2 (cons 3 (cons 4 nil))))
(list 1 2 3 4)
(define one-through-four (list 1 2 3 4))
one-through-four

(cons (list 1 2 3 4) (list 5 6 7 8))
(car (list 1 2 3 4))
(cdr (list 1 2 3 4))

(cadr (list 1 2 3 4))
;(list-ref (list 1 2 3 4) 3)

(define (list-ref items n)
  (if (= n 0)
      (car items)
      (list-ref (cdr items) (- n 1))))
(define squares (list 1 4 9 16 25))
(list-ref squares 3)
(cdr (cdr (list 1 2)))

(define (length items)
  (if (null? items)
      0
(+ 1 (length (cdr items)))))
(define odds (list 1 3 5 7))
(length odds)

; Iterative length
;(define (length items)
;  (define (length-iter a count)
;    (if (null? a)
;        count
;        (length-iter (cdr a) (+ 1 count))))
;  (length-iter items 0))

(define (append list1 list2)
  (if (null? list1)
      list2
      (cons (car list1) (append (cdr list1) list2))))

(append odds squares)