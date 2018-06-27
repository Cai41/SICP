#lang sicp

(#%require "2-7.rkt")
(#%require "2-8.rkt")

(define (width-sum a b)
  (/ (+ a b) 2.0))

(define (width-sub a b)
  (/ (+ a b) 2.0))

(define (width i)
  (- (upper-bound i) (lower-bound i)))

(define i1 (make-interval -1 3))

(define i2 (make-interval 2 4))

(add-interval i1 i2)
(width-sum (width i1) (width i2))

(sub-interval i1 i2)
(width-sub (width i1) (width i2))