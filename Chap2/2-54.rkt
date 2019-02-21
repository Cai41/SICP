#lang sicp

(define (equal? l1 l2)
  (if (and (pair? l1) (pair? l2))
      (and (eq? (car l1) (car l2))
           (equal? (cdr l1) (cdr l2)))
      (eq? l1 l2)))
