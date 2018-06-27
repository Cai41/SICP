#lang sicp

;; a(1 - t1)b(1 - t2) = ab(1 - t1- t2 + t1t2)
;; a(1 + t1)b(1 + t2) = ab(1 + t1 + t2 + t1t2)
;; width = ab(t1 + t2)
;; mid = ab(1 + t1t2)
;; t = (t1 + t2) / (1 + t1t2)
(define (mul-tolerance t1 t2)
  (/ (+ t1 t2) (+ 1 (* t1 t2))))

(mul-tolerance 0.2 0.3)