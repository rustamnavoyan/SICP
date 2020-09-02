#lang sicp
(define (accumulate op initial sequence)
  (if (null? sequence) initial
      (op (car sequence)
          (accumulate op initial (cdr sequence)))))

(define (enumerate-interval first last)
  (if (> first last) nil
      (append (list first) (enumerate-interval (+ first 1) last))))


(accumulate append nil
            (map (lambda (i)
                   (map (lambda (j) (list i j))
                        (enumerate-interval 1 (- i 1))))
                 (enumerate-interval 1 3)))