#lang sicp
(define (filter predicate sequence)
  (cond ((null? sequence) nil)
        ((predicate (car sequence))
         (cons (car sequence)
               (filter predicate (cdr sequence))))
        (else (filter predicate (cdr sequence)))))

(filter odd? (list 1 2 3 4 5))

(define (accumulate op initial sequence)
  (if (null? sequence) initial
      (op (car sequence)
          (accumulate op initial (cdr sequence)))))
(accumulate * 1 (list 1 2 3 4 5))

(define (enumerate-interval low high)
  (if (> low high) nil
      (cons low (enumerate-interval (+ low 1) high))))
(enumerate-interval 2 7)

(define (enumerate-tree tree)
  (cond ((null? tree) nil)
        ((not (pair? tree)) (list tree))
        (else (append (enumerate-tree (car tree))
                      (enumerate-tree (cdr tree))))))
(enumerate-tree (list 1 (list 2 (list 3 4)) 5))

(define (square x) (* x x))
(define (sum-odd-squares tree)
  (accumulate
   + 0 (map square (filter odd? (enumerate-tree tree)))))

(sum-odd-squares (list 1 2 3 4 5))

(define (fib n)
  (define (fib-inner i prev next)
    (if (= i n)
        next
        (fib-inner (+ i 1) next (+ prev next))))
  (fib-inner 0 0 1))
(fib 0)
(fib 1)
(fib 2)
(fib 3)
(fib 4)
(fib 5)
(fib 6)

(define (even-fibs n)
  (accumulate cons nil
              (filter even? (map fib (enumerate-interval 0 n)))))

(define (flatmap proc seq)
  (accumulate append nil (map proc seq)))

(map square (list 2 3 4 5))
(accumulate append nil (list (list 2) (list 3)))
;(flatmap square (list (list 2 3) (list 4 5)))
(map (lambda (i) (list i 99)) (list 2 3 4 5))

(append (list 1 2) 3)
(append (list 1 2) nil)
(append (list 1 2) (list 3))

(define (permutations s)
  (if (null? s) ; empty set?
      (list nil) ; sequence containing empty set
      (flatmap (lambda (x)
                 (map (lambda (p) (cons x p))
                      (permutations (remove x s))))
               s)))


  
