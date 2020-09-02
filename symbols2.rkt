#lang sicp
(define a 1)
(define b 2)
(list a b)

(list 'a 'b)

(list 'a b)

(list 'quote '(a b c))

(list 'car (list 'quote '(a b c)))

(newline)

(define (equal? a b)
  (cond ((and (null? a) (null? b)) true)
        ((and (not (pair? a)) (not (pair? b))) (eq? a b))
        ((not (= (length a) (length b))) false)
        ((not (eq? (car a) (car b))) false)
        (else (equal? (cdr a) (cdr b)))))

(list 'a 'b 'c) ;(a b c)
(list (list 'george)) ;((george))
(cdr '((x1 x2) (y1 y2))) ;((y1 y2))
(cadr '((x1 x2) (y1 y2))) ;(y1 y2)
(pair? (car '(a short list))) ;(#f)
(memq 'red '((red shoes) (blue socks))) ;(#f)
(memq 'red '(red shoes blue socks)) ;(red shoes blue socks)

(equal? (car '(a b d c)) (car '(a b c)))
