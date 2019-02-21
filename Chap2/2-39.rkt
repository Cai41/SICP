#lang sicp

(#%require "2-38.rkt")

(define (reverse-1 sequence)
  (fold-right (lambda (x y) (append y (list x))) nil sequence))

(define (reverse-2 sequence)
  (fold-left (lambda (x y) (cons y x)) nil sequence))

(display (reverse-1 '(1 2 3)))
(newline)
(display (reverse-2 '(1 2 3)))
