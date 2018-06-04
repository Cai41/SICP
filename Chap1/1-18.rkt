#lang sicp

(define (double a)
  (+ a a))

(define (halve a)
  (/ a 2))

(define (even? n)
  (= (remainder n 2) 0))

(define (multiply a b)
  (multuplyHelper 0 a b))

(define (multuplyHelper sum a b)
  (cond ((or (= b 0) (= a 0)) sum)
        ((even? b) (multuplyHelper sum (double a) (halve b)))
        (else (multuplyHelper (+ sum a) a (- b 1)))))

(multiply 3 9)
(multiply 9 10)
(multiply 12 12)