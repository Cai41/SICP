#lang sicp

(define (double f)
  (lambda (x) (f (f x))))

(define (inc x) (+ x 1))

;; 2^(2^(2^(2^...)))) => number of 2 == number of double
(((double (double double)) inc) 5)
;; ((lambda (x) ((double double) ((double double) x))) inc) => ((double double) ((doubel double) inc)) => ((double double) inc4)) => (double (double inc4)) => ((lambda (x) ((double inc4) ((double inc4) x)))
(((double double) inc) 5)
;; ((lambda (x) (double (double x)) inc) => (double (double inc)) => ((lambda (x) ((double inc) ((double inc) x)))
((double inc) 5)
;; (lambda (x) (inc (inc x)))
