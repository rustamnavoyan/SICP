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

(sum prime? square 10 inc 15)

(prod even? cube 10 inc 15)

(define (product-of-relative-primes n) 
   (define (filter x) 
     (relative-prime? x n)) 
 (filtered-accumulate filter * 1 identity 1 inc n))

(product-of-relative-primes 5) 


