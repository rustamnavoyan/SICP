#lang sicp
;3.13
(define x (list 'a 'b))
(define y (list 'c 'd))
(define z (append x y))
z
(cdr x)

(define (append! x y)
  (set-cdr! (last-pair x) y)
  x)

(define (last-pair x)
  (if (null? (cdr x)) x (last-pair (cdr x))))

(last-pair (list 'a 'b 'c 'd))

(define w (append! x y))
w
(cdr x)

(newline)

;3.14
(define (make-cycle x)
  (set-cdr! (last-pair x) x)
  x)

(define z2 (make-cycle (list 'a 'b 'c)))
(make-cycle (list 'a 'b 'c))
(append! (list 'a 'b 'c) (list 'a 'b 'c))
z2
;(last-pair z2)

;3.15
(define (mystery x)
  (define (loop x y)
    (if (null? x)
        y
        (let ((temp (cdr x)))
          (set-cdr! x y)
          (loop temp x))))
  (loop x '()))
(define v (list 'a 'b 'c 'd))
(define w2 (mystery v))
w2
