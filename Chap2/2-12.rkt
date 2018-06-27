#lang sicp

(#%require "2-7.rkt")
(#%provide make-center-percent percent center)

(define (make-center-width c w)
  (make-interval (- c w) (+ c w)))

(define (center i)
  (/ (+ (lower-bound i) (upper-bound i)) 2))

(define (width i)
  (/ (- (upper-bound i) (lower-bound i)) 2))

(define (make-center-percent c p)
  (make-center-width c (* c p)))

(define (percent i)
  (/ (width i) (center i)))

;; (make-center-percent 10 0.1)
;; (percent (make-center-percent 10 0.1))