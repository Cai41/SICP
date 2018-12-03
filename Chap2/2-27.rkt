#lang sicp

(define (deep-reverse items)
  (define (reverse-if-pair item)
    (if (pair? item)
        (iter item '())
        item))
  (define (iter items result)
    (if (null? items)
        result
        (iter (cdr items) (cons (reverse-if-pair (car items)) result))))
  (iter items '()))

(define x (list (list 1 2) (list 3 4)))
(display x)
(newline)
(display (deep-reverse x))