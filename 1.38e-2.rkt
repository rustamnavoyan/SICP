#lang sicp

(define (pow x a)
  (cond ((= a 1) x)
        ((= (remainder a 2) 0) (* (pow x (/ a 2)) (pow x (/ a 2))))
        (else (* x (pow x (- a 1))))))

(define (cont-frac op n d k)
  (define (cont-frac-iter i)
  (cond ((= i k) 0)
        (else (/ (n i) (op (d i) (cont-frac-iter (+ i 1)))))))
  (cont-frac-iter 1))

(cont-frac + (lambda (i) 1.0) (lambda (i)
                              (cond ((= (remainder i 3) 2) (* (/ (+ i 1) 3) 2)) (else 1))) 20)

(define (tan-cf x k) (cont-frac - (lambda (i) (pow x i)) (lambda (i) (- (* i 2) 1)) k))

(tan-cf 0.785398 60)

(pow 0.7854 1)


; 1, 2, 1, 1, 4, 1, 1, 6, 1,  1,  8,  1,  1, 10
; 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14