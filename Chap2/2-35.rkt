#lang sicp

(#%require "chap2-lib.rkt")

(define (count-leaves t)
  (accumulate +
              0
              (map
               (lambda (x) (if (pair? x)
                               (count-leaves x)
                               1))
               t)))

(define x (cons (list 1 2) (list 3 4)))
(display (count-leaves x))
(newline)
(display (count-leaves (list x x)))                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                              