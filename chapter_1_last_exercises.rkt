#lang sicp

;1.42
(define (compose f g) (lambda (x) (f (g x))))

(define (square x) (* x x))
(define (inc x) (+ x 1))

((compose square inc) 9)

;1.43
(define (repeated f n) (lambda (x)
                          (cond ((= n 0) x)
                                (else (f ((repeated f (- n 1)) x))))))
((repeated square 2) 5)

;1.44
(define dx 0.001)
(define (smooth f) (lambda (x) (/ (+ (f (- x dx)) (f x) (f (+ x dx))) 3)))

((smooth square) 5)

; Substitution model is applicative-order evaluation
; (sum-of-squares (+ a 1) (* a 2))
; (sum-of-squares (+ 5 1) (* 5 2))
; (+ (square 6) (square 10))
; (+ (* 6 6) (* 10 10))
; (+ 36 100)
; 136

; Substitution model is normal-order evaluation
; (sum-of-squares (+ a 1) (* a 2))
; (sum-of-squares (+ 5 1) (* 5 2))
; (+ (square (+ 5 1)) (square (* 5 2)) )
; (+ (* (+ 5 1) (+ 5 1)) (* (* 5 2) (* 5 2)))
; (+ (* 6 6) (* 10 10))
; (+ 36 100)
; 136
