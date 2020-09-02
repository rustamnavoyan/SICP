#lang sicp

(define (element-of-set? x set)
  (cond ((null? set) false)
        ((equal? x (car set)) true)
        (else (element-of-set? x (cdr set)))))

(define (intersection-set set1 set2)
  (cond ((or (null? set1) (null? set2)) '())
        ((element-of-set? (car set1) set2)
         (cons (car set1) (intersection-set (cdr set1) set2)))
        (else (intersection-set (cdr set1) set2))))

;(define (union-set set1 set2)
 ; (cond ((and (null? set1) (null? set2)) '())
  ;      ((null? set2) set1)
   ;     ((null? set1) set2)
    ;    ((not (element-of-set? (car set2) set1))
     ;    (union-set (append set1 (list (car set2))) (cdr set2)))
      ;  (else (union-set set1 (cdr set2)))))
(define (union-set set1 set2)
  (cond ((null? set2) set1)
        ((null? set1) set2)
        (else (union-set
               (if (element-of-set? (car set2) set1) set1 (append set1 (list (car set2))))
               (cdr set2)))))

;(intersection-set (list 3 2) (list 1 2))
(union-set (list 3 2) (list 1 2))
(union-set '() '())
(union-set '(7) '())
(union-set '() '(8))
