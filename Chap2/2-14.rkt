#lang sicp

(#%require "2-7.rkt")
(#%require "2-12.rkt")

(define (par1 r1 r2)
  (div-interval (mul-interval r1 r2)
                (add-interval r1 r2)))

(define (par2 r1 r2)
  (let ((one (make-interval 1 1)))
    (div-interval
     one (add-interval (div-interval one r1)
                       (div-interval one r2)))))

(define r1 (make-center-percent 100 0.1))
(define r2 (make-center-percent 300 0.2))

(center (par1 r1 r2))
(percent (par1 r1 r2))
(newline)

(center (par2 r1 r2))
(percent (par2 r1 r2))
(newline)

(define r3 (div-interval r1 r1))
(define r4 (div-interval r1 r2))

(center r3)
(percent r3)
(newline)

(center r4)
(percent r4)
(newline)
