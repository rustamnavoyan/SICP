#lang sicp
;3.1
(define (make-accumulator balance)
  (lambda (amount)
        (begin (set! balance (+ balance amount))
               balance)))

(define ma1 (make-accumulator 15))
(ma1 40)
(ma1 3)

;3.2
(define (make-monitored f)
  (define mf
    (let ((count 0))
      (lambda (action)
         (cond ((eq? action 'how-many-calls?) count)
               ((eq? action 'reset-count) (set! count 0))
               (else (begin (set! count (+ count 1))
               (f action)))))))
  mf)

(define M1 (make-monitored sqrt))
(M1 15)
(M1 36)
(M1 'how-many-calls?)
(M1 'reset-count)
(M1 'how-many-calls?)
(M1 100)
(M1 'how-many-calls?)

;3.3
(define (make-account balance password)
  (define (withdraw amount)
    (if (>= balance amount)
        (begin (set! balance (- balance amount))
               balance)
        "Insufficient funds"))
  (define (deposit amount)
    (set! balance (+ balance amount))
    balance)
  (define (dispatch pass m)
    (cond ((not (eq? pass password)) (lambda (amount) "Incorrect password"))
          ((eq? m 'withdraw) withdraw)
          ((eq? m 'deposit) deposit)
          (else (error "Unknown request: MAKE-ACCOUNT" m))))
  dispatch)

(newline)
(define acc (make-account 100 'apero))
((acc 'apero 'withdraw) 60)
((acc 'aper 'deposit) 60)

;3.3
(define (make-account2 balance password)
  (define (call-the-cops) "Call the cops")
  (let ((count 0) (limit 7))
  (define (withdraw amount)
    (if (>= balance amount)
        (begin (set! balance (- balance amount))
               balance)
        "Insufficient funds"))
  (define (deposit amount)
    (set! balance (+ balance amount))
    balance)
  (define (dispatch pass m)
    
    (cond ((not (eq? pass password)) (lambda (amount)
                                       (if (> count limit) (call-the-cops) (begin (set! count (+ count 1)) "Incorrect password"))))
          ((eq? m 'withdraw) withdraw)
          ((eq? m 'deposit) deposit)
          (else (error "Unknown request: MAKE-ACCOUNT" m))))
  dispatch))

(newline)
(define acc2 (make-account2 100 'apero))
((acc2 'apero 'withdraw) 60)
((acc2 'aper 'deposit) 60)
((acc2 'aper 'deposit) 60)
((acc2 'aper 'deposit) 60)
((acc2 'aper 'deposit) 60)
((acc2 'aper 'deposit) 60)
((acc2 'aper 'deposit) 60)
((acc2 'aper 'deposit) 60)
((acc2 'aper 'deposit) 60)
((acc2 'aper 'deposit) 60)

;3.8
(define f
  (let ((val 1))
    (lambda (arg)
      (begin (set! val (* arg val)) val ))))

(+ (f 0) (f 1)) ;0
(+ (f 1) (f 0)) ;1
