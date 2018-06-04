#lang sicp
;; recur
(define (+1 a b)
  (if (= a 0) b (inc (+ (dec a) b))))

;; iter
(define (+2 a b)
  (if (= a 0) b (+ (dec a) (inc b))))