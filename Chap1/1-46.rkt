#lang sicp

(define (iterative-improve good-enough? improve)
  (define (try guess)
    (let ((next (improve guess)))
      (if (good-enough? guess)
          guess
          (try next))))
  (lambda (x) (try x)))

(define (average x y)
  (/ (+ x y) 2))

(define (square x)
  (* x x))

(define (sqrt-iter guess x)
  (define (good-enough? guess)
    (< (abs (- (square guess) x)) 0.001))
  (define (improve guess)
    (average guess (/ x guess)))
  ((iterative-improve good-enough? improve) guess))

(sqrt-iter 4.0 81)

(define tolerance 0.00001)

(define (close-enough? v1 v2)
  (< (abs (- v1 v2))
     tolerance))

(define (fixed-point f first-guess)
  (define (good-enough? guess)
    (close-enough? guess (f guess)))
  ((iterative-improve good-enough? f) first-guess))

(fixed-point cos 1.0)
(fixed-point (lambda (y) (+ (sin y) (cos y))) 1.0)