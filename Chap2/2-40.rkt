#lang sicp

(#%require "chap2-lib.rkt")
(#%provide unique-pairs)

(define (unique-pairs n)
  (flatmap (lambda (x)
             (map (lambda (p) (list x p)) (enumerate-interval 1 (- x 1))))
           (enumerate-interval 1 n)))

(define (make-pair-sum pair)
  (list (car pair) (cadr pair) (+ (car pair) (cadr pair))))

(define (prime-sum? pair)
  (prime? (+ (car pair) (cadr pair))))

(define (prime? n)
  (= n (smallest-divisor n)))

(define (smallest-divisor n) (find-divisor n 2))

(define (square x) (* x x))

(define (find-divisor n test-divisor)
  (cond ((> (square test-divisor) n) n)
        ((divides? test-divisor n) test-divisor)
        (else (find-divisor n (+ test-divisor 1)))))
(define (divides? a b) (= (remainder b a) 0))

(define (prime-sum-pairs n)
  (map make-pair-sum
       (filter prime-sum? (unique-pairs n))))

;;(display (prime-sum-pairs 5))
