#lang sicp

(define (make-frame origin edge1 edge2)
  (list origin edge1 edge2))

(define (origin-frame f)
  (list-ref f 0))

(define (edge1-frame f)
  (list-ref f 1))

(define (edge2-frame f)
  (list-ref f 2))

(define (make-frame-1 origin edge1 edge2)
  (cons origin (cons edge1 edge2)))

(define (origin-frame-1 f)
  (car f))

(define (edge1-frame-1 f)
  (car (cdr f)))

(define (edge2-frame-1 f)
  (cdr (cdr f)))