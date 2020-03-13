#lang sicp

(define (accumulate combiner null-value term a next b)
  (if (> a b) null-value
      (combiner (term a) (accumulate combiner null-value term (next a) next b))))

(define (accumulate combiner null-value term a next b)
  (define (iter a result)
    (if (> a b) null-value
    (iter (next a) (combiner (term a) result)))
  (if (> a b) null-value
      (combiner (term a) (accumulate combiner null-value term (next a) next b))))
  (iter a null-value))

; Production
(define (production term a next b)
  (accumulate * 1 term a next b))

(define (cube a) a)

(define (prod-iterative term a next b) (prod-iter term a next b 1))
(define (prod-iter term a next b result)
  (if (> a b) result
  (prod-iter term (next a) next b (* result (term a))))
  )

(production cube 5 inc 10)
(prod-iterative cube 5 inc 10)

; Factorial
(define (factorial a)
  (if (= a 1) 1
      (* a (factorial (dec a)))))

(factorial 30)

; PI approximation
(define (pi-approx n a b)

  (define (numerator k)
    (cond ((= (remainder k 2) 1) (+ k 1))
          (else (+ k 2))))
  (define (denominator k)
    (cond ((= (remainder k 2) 0) (+ k 1))
          (else (+ k 2))))
  (define (fraction k)
    (/ (numerator k) (denominator k)))

  (production fraction 1 inc n))

(pi-approx 5 2 30)