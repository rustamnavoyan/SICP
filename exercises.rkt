#lang sicp
(define (map proc items)
  (if (null? items)
      nil
      (cons (proc (car items))
            (map proc (cdr items)))))
(define (scale-list items factor)
  (map (lambda (x) (* x factor))
       items))
(scale-list (list 1 2 3 4 5) 10)


(map abs (list -10 2.5 -11.6 17))

(map (lambda (x) (* x x)) (list 1 2 3 4))

;(define (square-list items)
 ; (if (null? items)
  ;    nil
   ;   (cons (* (car items) (car items)) (square-list (cdr items)))))

(define (square x) (* x x))

;(define (square-list items)
 ; (define (iter things answer)
  ;  (if (null? things)
   ;     answer
    ;    (iter (cdr things)
     ;         (cons (square (car things))
      ;              answer))))
  ;(iter items nil))

(define (square-list items)
  (define (iter things answer)
    (if (null? things)
        answer
        (iter (cdr things)
              (cons answer
                    (square (car things))))))
  (iter items nil))
; (2 4 6), nil; (4 6) (4); (6) (16 4)

;(define (square-list items)
;(map (lambda (x) (* x x)) items))

(square-list (list 2 4 6 8 10))

(define (for-each proc list)
  (if (not (null? list)) (and (proc (car list)) (for-each proc (cdr list)))))

(for-each (lambda (x)
            (newline)
            (display x))
          (list 57 321 88))

