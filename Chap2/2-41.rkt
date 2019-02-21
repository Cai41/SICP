#lang sicp

(#%require "chap2-lib.rkt")
(#%require "2-40.rkt")

(define (generate-triple n)
  (flatmap (lambda (i)
             (map (lambda (x) (cons i x))
                  (unique-pairs (- i 1))))
           (enumerate-interval 1 n)))

(define (three-sum n s)
  (filter (lambda (l) (= (+ (car l) (car (cdr l)) (car (cdr (cdr l)))) s))
          (generate-triple n)))

(display (three-sum 11 26))