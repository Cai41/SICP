#lang sicp

(define (product term a next b)
  (if (> a b)
      1
      (* (term a) (product term (next a) next b))))

(define (product-iter term a next b)
  (define (iter a result)
    (if (> a b)
        result
        (iter (next a) (* (term a) result))))
  (iter a 1))

(define (identity x) x)
(define (inc x) (+ x 1))

(define (factorial n)
  (product identity 1 inc n))

(define (factorial-iter n)
  (product identity 1 inc n))

(factorial 5)
(factorial-iter 5)

(define (pi n)
  (define (result n)
    (if (even? n)
        (/ (+ n 2) (+ 1 n))
        (/ (+ n 1) (+ n 2))))
  (* 4.0 (product result 1 inc n)))

(define (pi-iter n)
  (define (result n)
    (if (even? n)
        (/ (+ n 2) (+ 1 n))
        (/ (+ n 1) (+ n 2))))
  (* 4.0 (product-iter result 1 inc n)))

(pi 1000)
(pi-iter 1000)
