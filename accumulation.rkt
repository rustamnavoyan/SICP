#lang sicp
(define (square x) (* x x))

;2.33
(define (accumulate op initial sequence)
  (if (null? sequence) initial
      (op (car sequence)
          (accumulate op initial (cdr sequence)))))
(accumulate * 1 (list 1 2 3 4 5))

(define (map p sequence)
  (accumulate (lambda (x y) (cons (p x) y)) nil sequence))
(map square (list 1 2 3 4 5 6))
(define (append seq2 seq1)
  (accumulate cons seq1 seq2))
(append (list 1 2 3) (list 4 5 6))

(define (length sequence)
  (accumulate (lambda (x y) (+ 1 y)) 0 sequence))
(length (list 1 2 3 4 5 6 7))

;2.34
(define (horner-eval x coefficient-sequence)
  (accumulate (lambda (this-coeff higher-terms) (+ (* higher-terms x) this-coeff))
              0
              coefficient-sequence))

(horner-eval 2 (list 1 3 0 5 0 1))

;2.36
(define (accumulate-n op init seqs)
  (if (null? (car seqs))
      nil
      (cons (accumulate op init (map car seqs))
            (accumulate-n op init (map cdr seqs)))))

(accumulate-n + 0 (list (list 1 2 3) (list 4 5 6) (list 7 8 9) (list 10 11 12)))

(map car (list (list 9 10) (list 8 10) (list 7 6)))

(define (invert-matrix seq)
  (if (null? (car seq))
      nil
      (cons (map car seq) (invert-matrix (map cdr seq)))))

(invert-matrix (list (list 1 2 3) (list 4 5 6) (list 7 8 9) (list 10 11 12)))

;2.38
(define (fold-left op initial sequence)
  (define (iter result rest)
    (if (null? rest)
        result
        (iter (op result (car rest))
              (cdr rest))))
  (iter initial sequence))

(accumulate / 1 (list 1 2 3))
(fold-left / 1 (list 1 2 3))
(accumulate list nil (list 1 2 3))
(fold-left list nil (list 1 2 3))

;2.39
(define (reverse items)
  (accumulate (lambda (first already-reversed)
                (append already-reversed (list first)))
              nil
              items))
(define (reverse-using-left items) 
   (fold-left (lambda (result first) (cons first result)) 
              nil
              items))
(reverse (list 1 4 9 16 25))
(reverse-using-left (list 1 4 9 16 25))
