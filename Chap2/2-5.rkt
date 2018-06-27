#lang sicp

(define (square x) (* x x))

(define (exp a n)
  (cond ((= n 0) 1)
        ((even? n) (square (exp a (/ n 2))))
        (else (* a (exp a (- n 1))))))

(define (cons a b)
  (* (exp 2 a) (exp 3 b)))

(define (iter a n res)
  (if (= (remainder a n) 0)
      (iter (/ a n) n (+ res 1))
      res))

(define (car a)
  (iter a 2 0))

(define (cdr a)
  (iter a 3 0))

(car (cons 7 10))
(cdr (cons 12 22))