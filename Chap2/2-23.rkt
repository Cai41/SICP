#lang sicp

(define (for-each f list)
  (define (helper list item)
    (if (null? list)
        (newline)
        (helper (cdr list) (f (car list)))))
  (helper list nil))

(for-each (lambda (x)
            (newline)
            (display x))
          (list 57 321 88))

