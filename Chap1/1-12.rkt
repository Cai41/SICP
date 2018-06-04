#lang sicp
(define (pasc-ele r c)
  (if (or (= r 1) (= c 1) (= r c))
      1
      (+ (pasc-ele (- r 1) (- c 1))
         (pasc-ele (- r 1) c))))


(pasc-ele 5 3)

  

