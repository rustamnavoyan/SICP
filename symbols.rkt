#lang sicp
(define (equal? a b)
  (cond ((and (null? a) (null? b)) true)
        ((and (not (pair? a)) (not (pair? b))) (eq? a b))
        ((not (= (length a) (length b))) false)
        ((not (eq? (car a) (car b))) false)
        (else (equal? (cdr a) (cdr b)))))

;(equal? '(a c b) '(a b c))
 (equal? '(1 2 3 (4 5) 6) '(1 2 3 (4 5) 6)) 

(car ''abracadabra)
(car (quote (quote something)))
(quote (quote something))
(quote something)
(quote quote)