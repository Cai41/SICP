#lang sicp

(#%require "chap2-lib.rkt")

(define (dot-product v w)
  (accumulate + 0 (map * v w)))

(define (matrix-*-vector m v)
  (map (lambda (mi) (dot-product mi v)) m))

(define (transpose mat)
  (accumulate-n cons nil mat))

(define (matrix-*-matrix m n)
  (let ((cols (transpose n)))
    (map (lambda (row) (matrix-*-vector cols row)) m)))

(display (matrix-*-matrix '((1 2) (3 5)) '((3 4) (9 1))))