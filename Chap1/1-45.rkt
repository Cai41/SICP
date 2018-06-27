#lang sicp

(define (average-damp f)
  (lambda (x) (average x (f x))))

(define (average x y)
  (/ (+ x y) 2))

(define tolerance 0.00001)

(define (fixed-point f first-guess)
  (define (close-enough? v1 v2)
    (< (abs (- v1 v2)) tolerance))
  (define (try guess)
    (let ((next (f guess)))
      (if (close-enough? guess next)
          next
          (try next))))
  (try first-guess))

(define (compose f g)
  (lambda (x) (f (g x))))

(define (double f)
  (lambda (x) (f (f x))))

(define (repeated f n)
  (cond ((= n 1) f)
        ((even? n) (double (repeated f (/ n 2))))
        (compose f (repeated f (- n 1)))))

(define (nth-root n x)
  (let ((damps-n (floor (log n 2))))
    (fixed-point ((repeated average-damp damps-n) (lambda (y) (/ x (fast-expt y (- n 1))))) 1.0)))

(define (fast-expt b n)
  (cond ((= n 0) 1)
        ((even? n) (square (fast-expt b (/ n 2))))
        (else (* b (fast-expt b (- n 1))))))

(define (square x)
  (* x x))

(nth-root 7 128)