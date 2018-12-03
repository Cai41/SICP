#lang sicp

(define (same-parity a . lst)
  (define valid?
    (if (even? a) even?  odd?))
  (define (filter-by-parity lst)
    (cond ((null? lst) nil)
          ((valid? (car lst)) (cons (car lst) (filter-by-parity (cdr lst))))
          (else (filter-by-parity (cdr lst)))))
  (cons a (filter-by-parity lst)))

(display (same-parity 1 2 3 4 5 6 7))
(newline)
(display (same-parity 2 3 4 5 6 7))

