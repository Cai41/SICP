#lang sicp
(define (double a)
  (+ a a))

(define (halve a)
  (/ a 2))

(define (even? n)
  (= (remainder n 2) 0))

(define (multi a b)
  (cond ((or (= a 0) (= b 0)) 0)
        ((= a 1) b)
        ((= b 1) a)
        ((even? b) (multi (double a) (halve b)))
        (else (+ a (multi a (- b 1))))))

(multi 3 9)
(multi 11 12)
(multi 9 8)