#lang sicp
(define (f1 n)
  (if (< n 3)
      n
      (+ (f1 (- n 1))
         (* 2 (f1 (- n 2)))
         (* 3 (f1 (- n 3))))))

(f1 14)

(define (f2 n)
  (if (< n 3)
      n
      (f2helper 1 2 3 (- n 1) 0)))

(define (f2helper a b c n d)
  (if (< n 3)
      (+ (* a n) (* b (- n 1)) (* c (- n 2)) d)
      (f2helper (+ b a) (+ c (* 2 a)) (* 3 a) (- n 1) d)))

(f2 14)