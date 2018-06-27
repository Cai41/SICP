#lang sicp

(#%require "2-7.rkt")

(define (div-interval-check-zero x y)
  (if (<= (* (upper-bound y) (lower-bound y)) 0)
      (error "y can not span zero")
      (mul-interval
       x
       (make-interval (/ 1.0 (upper-bound y))
                      (/ 1.0 (lower-bound y))))))

(div-interval-check-zero (make-interval 2 3) (make-interval -2 2))
