#lang sicp

(#%provide sub-interval)
(#%require "2-7.rkt")

(define (sub-interval a b)
  (make-interval (- (lower-bound a) (upper-bound b))
                 (- (upper-bound a) (lower-bound b))))
