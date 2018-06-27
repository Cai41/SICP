#lang sicp

(#%require "chap2-lib.rkt")

(define (make-rat-sign n d)
  (let ((g (gcd n d)))
    (if (> (* n d) 0)
        (cons (abs (/ n g)) (abs (/ d g)))
        (cons (- (abs (/ n g))) (abs (/ d g))))))

(print-rat (make-rat-sign -1 -2))
(print-rat (make-rat-sign 1 -2))
(print-rat (make-rat-sign -1 2))