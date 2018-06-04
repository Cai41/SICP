#lang sicp
(define (fib n)
  (fib-iter 1 0 0 1 n))

(define (fib-iter a b p q count)
  (cond ((= count 0) b)
        ((even? count)
         (fib-iter a
                   b
                   (+ (* q q) (* p p)) ; compute p′
                   (+ (* q q) (* 2 p q)) ; compute q′
                   (/ count 2)))
        (else (fib-iter (+ (* b q) (* a q) (* a p))
                        (+ (* b p) (* a q))
                        p
                        q
                        (- count 1)))))


;;a = bq + aq + ap, b = bp + aq

;;bpq+aqq+bqq+aqq+apq+bqp+aqp+app = b(2pq+qq) + a(2pq+qq) + a(qq+pp)
;;bpp+aqp+bqq+aqq+apq = b(qq+pp) + a(2pq+qq)

(fib 0)
(fib 1)
(fib 2)
(fib 3)
(fib 4)
(fib 5)
(fib 6)