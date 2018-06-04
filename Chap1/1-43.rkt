#lang sicp

(define (square x) (* x x))

(define (compose f g)
  (lambda (x) (f (g x))))

(define (double f)
  (lambda (x) (f (f x))))

(define (repeated f n)
  (cond ((= n 1) f)
        ((even? n) (double (repeated f (/ n 2))))
        (compose f (repeated f (- n 1)))))

((repeated square 2) 5)