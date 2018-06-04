#lang sicp
(define (A x y)
  (cond ((= y 0) 0)
        ((= x 0) (* 2 y))
        ((= y 1) 2)
        (else (A (- x 1) (A x (- y 1))))))

(A 1 10)
(A 2 4)
(A 3 3)

;; 2n
(define (f n) (A 0 n))
(f 0)
(f 1)
(f 2)
(f 3)

;; 2^n
(define (g n) (A 1 n))
(g 0)
(g 1)
(g 2)
(g 3)
(g 4)

;; 2^(2^(2^....)
(define (h n) (A 2 n))
(h 0)
(h 1)
(h 2)
(h 3)
(h 4)

;; 5n^2
(define (k n) (* 5 n n))