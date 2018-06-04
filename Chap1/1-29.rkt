#lang sicp
(define (sum term a next b)
  (if (> a b)
      0
      (+ (term a)
         (sum term (next a) next b))))

(define (integral f a b dx)
  (define (add-dx x)
    (+ x dx))
  (* (sum f (+ a (/ dx 2.0)) add-dx b)
     dx))

(define (simpson f a b n)
  (define h (/ (- b a) n))
  (define (next k)
    (+ k 1))
  (define (f1 k)
    (f (+ a (* k h))))
  (define (f2 k)
    (cond ((or (= k n) (= k 0)) (f1 k))
          ((even? k) (* 2 (f1 k)))
          (else (* 4 (f1 k)))))
  (/ (* h (sum f2 0 next n)) 3.0))

(define (cube x)
  (* x x x))

(simpson cube 0 1 100)
(simpson cube 0 1 1000)
(integral cube 0 1 0.01)
(integral cube 0 1 0.001)