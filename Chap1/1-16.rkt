#lang sicp
(define (even? n)
  (= (remainder n 2) 0))

(define (square x)
  (* x x))

(define (expHelper a b n)
  (cond ((= n 0) a)
        ((even? n) (expHelper a (square b) (/ n 2)))
        (else (expHelper (* a b) b (- n 1)))))

(define (exp b n)
  (expHelper 1 b n))

(exp 3 4)
           