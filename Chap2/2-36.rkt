#lang sicp

(#%require "chap2-lib.rkt")

(define (accumulate-n op init seqs)
  (if (null? (car seqs))
      nil
      (cons (accumulate op init (map (lambda (s) (car s)) seqs))
            (accumulate-n op init (map (lambda (s) (cdr s)) seqs)))))

(display (accumulate-n + 0 '((1 2 3) (4 5 6) (7 8 9) (10 11 12))))
