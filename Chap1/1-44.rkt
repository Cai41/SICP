#lang sicp

(define dx 0.00001)

(define (smooth f)
  (lambda (x) (/ (+ (f (- x dx)) (f x) (f (+x dx))) 3.0)))


(define (square x) (* x x))

(define (compose f g)
  (lambda (x) (f (g x))))

(define (double f)
  (lambda (x) (f (f x))))

(define (repeated f n)
  (cond ((= n 1) f)
        ((even? n) (double (repeated f (/ n 2))))
        (compose f (repeated f (- n 1)))))

(define (n-fold f n)
  ((repeated smooth n) f))