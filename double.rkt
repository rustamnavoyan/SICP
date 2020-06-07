#lang sicp

(define (double f) (lambda (x) (f (f x))))

;(((double double) inc) 5) = ?

;First solution
(double double) =
(lambda (f) (double (double f))) =
(lambda (f) (double (lambda (x) (f (f x))))) =
(lambda (f) (lambda (x1) ((lambda (x) (f (f x))) ((lambda (x) (f (f x))) x1)))) =
(lambda (f) (lambda (x1) (f (f (f (f x1)))))) =

(double (double double)) =
(double (lambda (f) (lambda (x1) (f (f (f (f x1))))))) =
(lambda (f1) ((lambda (f) (lambda (x1) (f (f (f (f x1)))))) (lambda (x1) (f1 (f1 (f1 (f1 x1))))))) =
(lambda (f1) (lambda (x1) (f1 (f1 (f1 (f1 (f1 (f1 (f1 (f1 (f1 (f1 (f1 (f1 (f1 (f1 (f1 (f1 x1)))))))))))))))))) =

(((double double) inc) 5) =
(((lambda (f1) (lambda (x1) (f1 (f1 (f1 (f1 (f1 (f1 (f1 (f1 (f1 (f1 (f1 (f1 (f1 (f1 (f1 (f1 x1)))))))))))))))))) inc) 5)
;21

;Second solution
;(((double (double double)) inc) 5)
;(((double (lambda (x) (double (double x)))) inc) 5)
;(((double (lambda (x) (double (lambda (x1) ((x (x x1))))))) inc) 5)
;(((double (lambda (x) (lambda (x2) ((lambda (x1) ((x (x x1))) ((lambda (x1) ((x (x x1)))) x2)))))) inc) 5)
;(((lambda (x3) ((lambda (x) (lambda (x2) ((lambda (x1) ((x (x x1))) ((lambda (x1) ((x (x x1)))) x2)))))
;                ((lambda (x) (lambda (x2) ((lambda (x1) ((x (x x1))) ((lambda (x1) ((x (x x1)))) x2))))) x3))) inc) 5)
;(((lambda (x) ((x (x (x (x x2)))))) (inc (inc (inc (inc x2))))) 5)
;((inc (inc (inc (inc (inc (inc (inc (inc (inc (inc (inc (inc (inc (inc (inc (inc x2)))))))))))))))) 5)

