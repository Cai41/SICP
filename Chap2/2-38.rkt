#lang sicp

(#%require "chap2-lib.rkt")
(#%provide fold-left fold-right)

(define (fold-left op initial sequence)
  (define (iter result rest)
    (if (null? rest)
        result
        (iter (op result (car rest))
              (cdr rest))))
  (iter initial sequence))

(define fold-right accumulate)

;;(display (fold-right / 1 (list 1 2 3)))
;;(newline)
;;(display (fold-left / 1 (list 1 2 3)))
;;(newline)
;;(display (fold-right list nil (list 1 2 3)))
;;(newline)
;;(display (fold-left list nil (list 1 2 3)))

;; op needs to be commutativity and associativity
