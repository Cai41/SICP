#lang sicp

(#%require "chap2-lib.rkt")

(define (map p sequence)
  (accumulate (lambda (x y) (cons (p x) y))
              nil
              sequence))

(define (append seq1 seq2)
  (accumulate cons seq2 seq1))

(define (length sequence)
  (accumulate (lambda (x y) (+ 1 y)) 0 sequence))

(define (square x) (* x x))
(display (map square '(1 2 3 4)))
(newline)
(display (append '(1 2 3) '(4 5 6)))
(newline)
(display (length '(1 2 3 4 5 5 6 100)))
