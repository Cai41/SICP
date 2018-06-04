#lang sicp

(define (cont-frac n d k)
  (define (helper i k)
    (let ((ni (n i))
          (di (d i)))
      (if (= i k)
          (/ ni di)
          (/ ni (+ di (helper (+ i 1) k))))))
  (helper 1 k))

(define (tan-cf x k)
  (let ((x2 (- (* x x))))
    (cont-frac (lambda (a) (if (= a 1) x x2))
               (lambda (a) (- (* 2 a) 1.0))
               k)))

(tan-cf (/ (* 3.1415926 45) 180) 200)
