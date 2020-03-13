#lang sicp

(define (square a) (* a a))

(define (sum term a next b)
  (if (> a b) 0
      (+ (term a) (sum term (next a) next b))))

(define (sum2 term a next b)
  (define (iter a result)
    (if (> a b) result
        (iter (next a) (+ result (term a)))))
  (iter a 0))

(define (cube a) (* a a a))
(define (inc a) (+ a 1))

(sum cube 10 inc 15)
(sum2 cube 10 inc 15)

(define (integral f a b dx)
(define (add-dx x)
(+ x dx))
(* (sum f (+ a (/ dx 2.0)) add-dx b)
dx))

(integral cube 0 1 0.001)

(define (sum-with-coef term-coef term a next k b n)
(if (> a b)
0
(+ (* (term-coef k n) (term a))
(sum-with-coef term-coef term (next a) next (+ k 1) b n))))

(define (integral2 f a b n) (integral2-iter f a b 0 n (/ (- b a) n)))
(define (integral2-iter f a b k n h)
  (define (coefficient k n)
    (cond ((or (= k 0) (= k n)) 1)
          ((= (remainder k 2) 1) 4)
          (else 2)))
  (define (add-h a) (+ a h))
  (* (sum-with-coef coefficient f a add-h k b n) (/ h 3)))

(integral2 cube 0 1 1000)

