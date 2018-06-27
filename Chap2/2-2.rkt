#lang sicp

(#%provide make-point x-point y-point
           make-segment start-segment end-segment
           print-point)

(define (print-point p)
  (newline)
  (display "(")
  (display (x-point p))
  (display ",")
  (display (y-point p))
  (display ")"))

(define (make-point x y)
  (cons x y))

(define (x-point p)
  (car p))

(define (y-point p)
  (cdr p))

(define (make-segment p1 p2)
  (cons p1 p2))

(define (start-segment s)
  (car s))

(define (end-segment s)
  (cdr s))

(define (midpoint-segment s)
  (define a (start-segment s))
  (define b (end-segment s))
  (make-point (average (x-point a) (x-point b))
              (average (y-point a) (y-point b))))

(define (average a b) (/ (+ a b) 2.0))
