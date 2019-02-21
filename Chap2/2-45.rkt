#lang sicp

(#%require sicp-pict)

(define (split op1 op2)
  (define (recur painter n)
    (if (= n 0)
        painter
        (let ((smaller (recur painter (- n 1))))
          (op1 painter (op2 smaller smaller)))))
  recur)
  

(define right-split (split beside below))

(define up-split (split below beside))

(paint (right-split einstein 4))

(paint (up-split einstein 4))