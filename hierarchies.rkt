#lang sicp
(define (count-leaves x)
  (cond (not (null? x) 0)
        ((not (pair? x)) 1)
        (else (+ (count-leaves (car x))
                 (count-leaves (cdr x))))))
(define x (cons (list 1 2) (list 3 4)))
(length x)
(car x)
(count-leaves (list 1 2))
(car (list 1 2))
(cdr (list 1 2))

(not (pair? (car (list 1 2))))
(not (pair? (cdr (list 1 2))))

(not (pair? (car (list 2))))
(not (pair? (cdr (list 2))))

;2.25
;(1 3 (5 7) 9)
;((7))
;(1 (2 (3 (4 (5 (6 7))))))
(car (car (cons (list 7) (list ))))
(car (cdr (car (cdr (cdr (list 1 3 (list 5 7) 9))))))
(car (cdr (car (cdr (car (cdr (car (cdr (car (cdr (car (cdr (list 1 (list 2 (list 3 (list 4 (list 5 (list 6 7))))))))))))))))))
(cons 1 (cons (cons 2 (cons 3 nil)) nil))

;2.26
(define xx (list 1 2 3))
(define y (list 4 5 6))

(append xx y)
(cons xx y)
(list xx y)

;2.27
(define (reverse lst)
  (define (reverse-iter lst result)
    (if (null? lst) result
      (reverse-iter (cdr lst) (cons (if (pair? (car lst)) (reverse (car lst)) (car lst)) result))))
  (reverse-iter lst nil))

(define my_list (list (list 1 2) (list 3 4)))
(reverse my_list)
(car my_list)
(length (car my_list))
(pair? (car my_list))

;2.28
(define z (list (list 1 2) (list 3 4)))
(define (fringe tree)
  (define (fringe-imp tree items)
    (if (null? tree)
        items
        (fringe-imp (cdr tree) (append items (if (pair? (car tree)) (fringe (car tree)) (list (car tree)))))))
    (fringe-imp tree nil))
(fringe z)
z
(cdr (list 1 2 3))
(pair? (car (cdr z)))
(append (list 4 5) (list 4 5))

;2.29
(define (make-mobile left right)
  (list left right))

(define (make-branch length structure)
  (list length structure))

(define (left-branch mobile)
  (car mobile))

(define (right-branch mobile)
  (car (cdr mobile)))

(define (branch-length branch)
  (car branch))

(define (branch-structure branch)
  (car (cdr branch)))

(define (total-weight mobile) 
   (cond ((null? mobile) 0) 
         ((not (pair? mobile)) mobile) 
         (else (+ (total-weight (branch-structure (left-branch mobile))) 
                  (total-weight (branch-structure (right-branch mobile)))))))

(cons 1 2)
(cons 1 (list 2))
(cons (list 1) 2)
(cons (list 1) (list 2))

(list 1 2)
(list 1 (list 2))
(list (list 1) 2)
(list (list 1) (list 2))

