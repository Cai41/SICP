#lang sicp
(define (sq a)
  (* a a))
(define (sum-of-sq a b)
  (+ (sq a) (sq b)))
(define (larger2 a b c f)
  (cond ((and (< a b) (a < c)) (f b c))
        ((and (< b a) (< b c)) (f a c))
        (else (f a b))))
(define (ex1-3 a b c)
  (larger2 a b c sum-of-sq))

(ex1-3 4 3 5)
(ex1-3 2 1 3)