#lang sicp
;(define x (list 'a 'b))
;(define z1 (cons x x))
;
;(define z2 (cons (list 'a 'b) (list 'a 'b)))
;
;(define (set-to-wow! x) (set-car! (car x) 'wow) x)
;
;(set-to-wow! z1)
;(set-to-wow! z2)

;(define (count-pairs x)
 ; (if (not (pair? x))
  ;    0
   ;   (+ (count-pairs (car x))
    ;     (count-pairs (cdr x))
     ;    1)))
(define (count-pairs x) 
   (let ((encountered '())) 
     (define (helper x) 
       (if (or (not (pair? x)) (memq x encountered)) 
         0 
         (begin 
           (set! encountered (cons x encountered)) 
           (+ (helper (car x)) 
              (helper (cdr x)) 
              1)))) 
   (helper x)))

(count-pairs (list 'a 'b 'c 'd))
(not (pair? (car (list 'a 'b))))

(define third (cons 'a 'b)) 
 (define second (cons third third)) 
 (define first (cons second second))
(count-pairs (cons 'a 'b))
