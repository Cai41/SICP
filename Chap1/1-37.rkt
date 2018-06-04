#lang sicp

(define (cont-frac n d k)
  (define (helper i k)
    (let ((ni (n i))
          (di (d i)))
      (if (= i k)
          (/ ni di)
          (/ ni (+ di (helper (+ i 1) k))))))
  (helper 1 k))

(define (gold-ration k)
  (cont-frac (lambda (i) 1.0)
             (lambda (i) 1.0)
             k))

(define (successive-from i k)
  (let ((res (gold-ration i)))
    (display res)
    (newline))
  (if (< i k)
      (successive-from (+ i 1) k)))

(define (successive k) (successive-from 1 k))

(successive 20)

(define (cont-frac-iter n d k)
  (define (helper i k res)
    (let ((ni (n i))
          (di (d i)))
      (if (= i 0)
          res
          (helper (- i 1) k (/ ni (+ di res))))))
  (helper k k 0))

(newline)
(cont-frac-iter (lambda (i) 1.0)
                (lambda (i) 1.0)
                20)

