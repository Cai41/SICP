#lang sicp

(define (cont-frac n d k)
  (define (helper i k)
    (let ((ni (n i))
          (di (d i)))
      (if (= i k)
          (/ ni di)
          (/ ni (+ di (helper (+ i 1) k))))))
  (helper 1 k))

(+ 2 (cont-frac (lambda (x) 1.0)
                (lambda (x) (cond ((< x 3) x)
                                  ((= (remainder x 3) 2)
                                   (+ (* (/ (- x 2) 3) 2) 2))
                                  (else 1)))
                100))