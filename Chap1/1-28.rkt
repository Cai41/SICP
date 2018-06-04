#lang sicp
(define (square x)
  (* x x))

(define (expmod base exp m)
  (define (check-nontrival x)
    (let ((sqaure-x (remainder (square x) m)))
      (if (and (= sqaure-x 1)
               (not (= x 1))
               (not (= x (- m 1))))
          0
          sqaure-x)))
  (cond ((= exp 0) 1)
        ((even? exp)
         (check-nontrival (expmod base (/ exp 2) m)))
        (else
         (remainder
          (* base (expmod base (- exp 1) m))
          m))))


(define (fermat-test n)
  (define (try-it a)
    (= (expmod a n n) a))
  (try-it (+ 1 (random (- n 1)))))

(define (prime? n times)
  (cond ((= times 0) true)
        ((fermat-test n) (prime? n (- times 1)))
        (else false)))

(define (prime-test n)
  (prime? n 100))

(prime-test 561)
(prime-test 1105)
(prime-test 1729)
(prime-test 2465)
(prime-test 2821)
(prime-test 6601)

(prime-test 2)
(prime-test 7)
(prime-test 13)
(prime-test 15)
(prime-test 37)
(prime-test 39)