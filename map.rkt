#lang sicp

;(define (scale-tree tree factor)
 ; (cond ((null? tree) nil)
  ;      ((not (pair? tree)) (* tree factor))
   ;     (else (cons (scale-tree (car tree) factor)
    ;                (scale-tree (cdr tree) factor)))))
(define (scale-tree tree factor)
  (map (lambda (sub-tree)
         (if (pair? sub-tree)
             (scale-tree sub-tree factor)
             (* sub-tree factor)))
       tree))
(list 1 (list 2 (list 3 4) 5) (list 6 7))
(scale-tree (list 1 (list 2 (list 3 4) 5) (list 6 7)) 10)

(define (square x) (* x x))

;2.30
;(define (square-tree tree)
 ; (cond ((null? tree) nil)
  ;      ((not (pair? tree)) (square tree))
   ;     (else (cons (square-tree (car tree))
    ;                (square-tree (cdr tree))))))

(define (tree-map proc tree)
  (map (lambda (sub-tree)
         (if (pair? sub-tree)
             (tree-map proc sub-tree)
             (proc sub-tree)))
       tree))

;2.31
(define (square-tree tree) (tree-map square tree))

(square-tree (list 1 (list 2 (list 3 4) 5) (list 6 7)))
(* (car (list 2)) 2)


(define ff (lambda (it tree)
                            (if (= it (car tree)) (ff it (cdr tree))) tree))
;2.32
(define (subsets s)
  (if (null? s)
      (list nil)
      (let ((rest (subsets (cdr s))))
        (append rest (map (lambda (x) (cons (car s) x)) rest)))))
(subsets (list 1 2 3))
;(subsets (1 2))
;rest = (subsets (2))
(subsets '(1 2 3))
rest ← (subsets '(2 3))
       rest ← (subsets '(3))
              rest ← (subsets '())
                     '(())
              (append '(()) (map (..)'(())))
              '(() (3))
       (append '(() (3)) (map (..)'(() (3))))
       '(() (3) (2) (2 3))
(append '(() (3) (2) (2 3)) (map (..)'(() (3) (2) (2 3))))
'(() (3) (2) (2 3) (1) (1 3) (1 2) (1 2 3))
