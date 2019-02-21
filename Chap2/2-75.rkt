#lang sicp

(define (square x) (* x x))

(define (make-from-real-imag x y)
  (define (dispatch op)
    (cond ((eq? op 'real-part) x)
          ((eq? op 'imag-part) y)
          ((eq? op 'magnitude) (sqrt (+ (square x) (square y))))
          ((eq? op 'angle) (atan y x))
          (else (error "Unknown op: MAKE-FROM-REAL-IMAG" op))))
  dispatch)

(define (apply-generic op arg) (arg op))

(define (make-from-mag-imag x y)
  (define (dispatch op)
    (cond ((eq? op 'real-part) (* x (cos y)))
          ((eq? op 'imag-part) (* x (sin y)))
          ((eq? op 'magnitude) x)
          ((eq? op 'angle) y)
          (else (error "Unknown op: MAKE-FROM-REAL-IMAG" op))))
  dispatch)

(define i1 (make-from-real-imag 3 4))
(define i2 (make-from-mag-imag (apply-generic 'magnitude i1) (apply-generic 'angle i1)))
(apply-generic 'real-part i2)
(apply-generic 'imag-part i2)
