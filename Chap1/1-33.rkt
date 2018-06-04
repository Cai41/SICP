#lang sicp

(define (accumulate combiner filter null-value term a next b)
  (cond ((> a b) null-value)
        ((filter a)
         (combiner (term a)
                   (accumulate combiner filter null-value term (next a) next b)))
        (else (accumulate combiner filter null-value term (next a) next b))))

(define (square x) (* x x))

(define (prime? n)
  (= n (smallest-divisor n)))

(define (find-divisor n test-divisor)
  (cond ((> (square test-divisor) n) n)
        ((divides? test-divisor n) test-divisor)
        (else (find-divisor n (+ test-divisor 1)))))

(define (divides? a b) (= (remainder b a) 0))

(define (smallest-divisor n) (find-divisor n 2))

(define (sum-prime-square a b)
  (accumulate + prime? 0 square a inc b))

(sum-prime-square 1 11)

(define (gcd a b)
  (if (= b 0)
      a
      (gcd b (remainder a b))))

(define (product-less-than-and-prime-n n)
  (define (filter a)
    (= 1 (gcd a n)))
  (accumulate * filter 1 identity 1 inc n))

(product-less-than-and-prime-n 12)
      