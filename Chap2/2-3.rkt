#lang sicp

(#%require "2-2.rkt")

(define (square x) (* x x))

(define (make-rect s1 s2)
  (cons s1 s2))

(define (length s)
  (define ss (start-segment s))
  (define es (end-segment s))
  (sqrt (+ (square (- (x-point ss) (x-point es)))
           (square (- (y-point ss) (y-point es))))))

(define (l-edge r)
  (car r))

(define (r-edge r)
  (cdr r))

(define (perimeter rect l-edge r-edge)
  (* 2 (+ (length (l-edge rect))
          (length (r-edge rect)))))

(define (area rect l-edge r-edge)
  (* (length (l-edge rect)) (length (r-edge rect))))

(define rect1 (make-rect (make-segment (make-point 0 0) (make-point 0 3))
                         (make-segment (make-point 0 3) (make-point 4 3))))

(area rect1 l-edge r-edge)
(perimeter rect1 l-edge r-edge)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(define (make-rect-1 s1 s2)
  (cons (start-segment s1) (end-segment s2)))

(define (l-edge-1 r)
  (make-segment (car r)
                (make-point (x-point (car r))
                            (y-point (cdr r)))))

(define (r-edge-1 r)
  (make-segment (make-point (x-point (car r))
                            (y-point (cdr r)))
                (cdr r)))

(define rect2 (make-rect-1 (make-segment (make-point 0 0) (make-point 0 3))
                         (make-segment (make-point 0 3) (make-point 4 3))))

(area rect2 l-edge-1 r-edge-1)
(perimeter rect2 l-edge-1 r-edge-1)