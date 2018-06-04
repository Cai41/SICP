#lang sicp

(define (timed-prime-test n)
  (newline)
  (display n)
  (start-prime-test n (runtime)))

(define (start-prime-test n start-time)
  (if (prime? n)
      (report-prime (- (runtime) start-time))))

(define (report-prime elapsed-time)
  (display " *** ")
  (display elapsed-time))

(define (smallest-divisor n) (find-divisor n 2))

(define (find-divisor n test-divisor)
  (cond ((> (square test-divisor) n) n)
        ((divides? test-divisor n) test-divisor)
        (else (find-divisor n (+ test-divisor 1)))))

(define (divides? a b) (= (remainder b a) 0))

(define (prime? n)
  (= n (smallest-divisor n)))

(define (square n) (* n n))

(define (even? n)
  (= (remainder n 2) 0))

(define (search-for-primes s e n)
  (define test-number (if (even? s) (+ s 1) s))
  (if (and (> n 0) (<= test-number e))
      (cond ((prime? test-number) (display test-number) (newline) (search-for-primes (+ test-number 2) e (- n 1)))
            (else (search-for-primes (+ test-number 2) e n)))))

(search-for-primes 1000 3000 3)
(search-for-primes 10000 30000 3)
(search-for-primes 100000 300000 3)

(timed-prime-test 1009)
(timed-prime-test 1013)
(timed-prime-test 1019)
(timed-prime-test 10007)
(timed-prime-test 10009)
(timed-prime-test 10037)
(timed-prime-test 100003)
(timed-prime-test 100019)
(timed-prime-test 100043)