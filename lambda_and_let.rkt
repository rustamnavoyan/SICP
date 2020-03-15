#lang sicp

(define (filtered-accumulate filter combiner null-value term a next b)
  (if (> a b) null-value
      (combiner (if (filter a) (term a) null-value) (filtered-accumulate filter combiner null-value term (next a) next b))))

(define (sum filter term a next b) (filtered-accumulate filter + 0 term a next b))

(define (prod filter term a next b) (filtered-accumulate filter * 1 term a next b))

(define (cube a) (* a a a))

(define (square a) (* a a))

(define (even? a) (= (remainder a 2) 0))

(define (smallest-divisor n) (find-divisor n 2))

(define (find-divisor n test-divisor)
  (cond ((> (square test-divisor) n) n)
        ((divides? test-divisor n) test-divisor)
        (else (find-divisor n (+ test-divisor 1)))))

(define (gcd a b)
  (if (= b 0) a
      (gcd b (remainder a b))))

(define (divides? a b) (= (remainder b a) 0))

(define (prime? n)
  (= n (smallest-divisor n)))

(define (relative-prime? a n)
  (= (gcd a n) 1))

(sum even? cube 10 inc 15)
(sum even? cube 10 (lambda (a) (+ a 1)) 15)

(sum prime? square 10 inc 15)

(prod even? cube 10 inc 15)

(define (product-of-relative-primes n) 
   (define (filter x) 
     (relative-prime? x n)) 
 (filtered-accumulate filter * 1 identity 1 inc n))

(product-of-relative-primes 5) 


((lambda (x y z) (+ x y (square z))) 1 2 3)

(define (f x y)
  (define (f-helper a b)
    (+ (* x (square a))
       (* y b)
       (* a b)))
  (f-helper (+ 1 (* x y)) (- 1 y)))

(define (f2 x y)
  ((lambda (a b)
     (+ (* x (square a))
        (* y b)
        (* a b)))
   (+ 1 (* x y))
   (- 1 y)))

(define (f3 x y)
  (let ((a (+ 1 (* x y))) (b (- 1 y)))
    (+ (* x (square a))
       (* y b)
       (* a b))))

(f 10 10)
(f2 10 10)
(f3 10 10)

(define (f4 x y)
  (define a (+ 1 (* x y)))
  (define b (- 1 y))
  (+ (* x (square a))
     (* y b)
     (* a b)))

(define (F g) (g 2))

(F square)

(F (lambda (z) (* z (+ z 1))))

;(define (plus4 x) (+ x 4))
(define plus4 (lambda (x) (+ x 4)))
(plus4 5)