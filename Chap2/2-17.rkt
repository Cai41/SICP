#lang sicp

(define (last-pair list)
  (if (null? (cdr list))
      list
      (last-pair (cdr list))))

(display (last-pair (list 23 72 149 34)))