#lang sicp

;(define x (cons (cons 1 2) (cons 3 4)))
;x
;(car x)
;(cdr x)

;(define (make-rat n d) (cons n d))
(define (make-rat n d)
(let ((g (gcd n d)))
(cons ((if (< (* n d) 0) - +) (/ n g)) (/ d g))))

(define (numer x) (car x))
(define (denom x) (cdr x))

(define (add-rat x y)
(make-rat (+ (* (numer x) (denom y))
(* (numer y) (denom x)))
(* (denom x) (denom y))))

(define (sub-rat x y)
(make-rat (- (* (numer x) (denom y))
(* (numer y) (denom x)))
(* (denom x) (denom y))))

(define (mul-rat x y)
(make-rat (* (numer x) (numer y))
(* (denom x) (denom y))))

(define (div-rat x y)
(make-rat (* (numer x) (denom y))
(* (denom x) (numer y))))

(define (equal-rat? x y)
(= (* (numer x) (denom y))
(* (numer y) (denom x))))

(make-rat 1 9)

(define (print-rat x)
(newline)
(display (numer x))
(display "/")
(display (denom x)))

(print-rat (make-rat 3 9))

(define one-half (make-rat 1 2))
(print-rat one-half)

(define one-third (make-rat 1 3))
(print-rat (add-rat one-half one-third))

(print-rat (mul-rat one-half one-third))

(print-rat (add-rat one-third one-third))

;(define (make-rat n d) (cons n d))
;(define (numer x)
;(let ((g (gcd (car x) (cdr x))))
;(/ (car x) g)))
;(define (denom x)
;(let ((g (gcd (car x) (cdr x))))
;(/ (cdr x) g)))



(define (cons x y)
  (define (dispatch m)
    (cond ((= m 0) x)
          ((= m 1) y)
          (else (error "Argument not 0 or 1: CONS" m))))
  dispatch)
(define (car z) (z 0))
(define (cdr z) (z 1))

