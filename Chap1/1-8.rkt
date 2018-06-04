#lang sicp
(define (cube-root x)
  (cube-root-iter x 1.0))

(define (cube-root-iter x guess)
  (if (good-enough? x guess)
      guess
      (cube-root-iter x (improve x guess))))

(define (good-enough? x guess)
  (< (/ (abs (- (cube guess)
                x))
        x)
     0.00001))

(define (cube x)
  (* x x x))

(define (square x)
  (* x x))

(define (improve x guess)
  (/ (+ (/ x (square guess))
        (* 2 guess))
     3))

(cube-root 1)
(cube-root 8)
(cube-root 27)
(cube-root 64)
(cube-root 125)