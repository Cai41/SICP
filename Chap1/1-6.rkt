#lang sicp
(define (new-if predicate then-clause else-clause)
  (cond (predicate then-clause)
        (else else-clause)))

(define (sqrt-iter guess x)
  (new-if (good-enough? guess x)
          guess
          (sqrt-iter (improve guess x) x)))

(define (square x)
  (* x x))

(define (average x y)
  (/ (+ x y) 2))

(define (good-enough? guess x)
  (< (abs (- (square guess) x)) 0.001))

(define (improve guess x)
  (average guess (/ x guess)))

(define (sqrt x)
  (sqrt-iter 1.0 x))

;; (sqrt 1.0) will loop forever, since LISP is applicative-order evaluation, so it will evaluate all the arguments of
;; new-if, i.e. (good-enough? guess x) and (sqrt-iter (improve guess x) x))), but evaluating sqrt-iter would recursively evaluate
;; new-if and its arguments, so the evaluate will recursive forever