#lang sicp

(define (fringe x)
  (define (fringes-if-pair item)
    (if (pair? item)
        (iter item '())
        (list item)))
  (define (iter items result)
    (if (null? items)
        result
        (iter (cdr items) (append result (fringes-if-pair (car items))))))
  (iter x '()))

(define x (list (list 1 2) (list 3 4)))
(display (fringe x))
(newline)
(display (fringe (list x x)))