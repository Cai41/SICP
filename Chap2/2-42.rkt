#lang sicp

(#%require "chap2-lib.rkt")

(define empty-board '())

(define (adjoin-position new-row k rest-of-queens)
  (cons (list new-row k) rest-of-queens))

(define (safe? k positions)
  (let ((new-position (car positions))
        (rest-positions (cdr positions)))
    (validate new-position rest-positions)))

(define (validate new-position rest-positions)
  (accumulate (lambda (rest-position result)
                (let ((x1 (car rest-position))
                      (y1 (car (cdr rest-position)))
                      (x2 (car new-position))
                      (y2 (car (cdr new-position))))
                  (and result
                       (not (= x1 x2))
                       (not (= y1 y2))
                       (not (= (abs (- x1 x2)) (abs (- y1 y2)))))))
              #t
              rest-positions))
  
(define (queens board-size)
  (define (queen-cols k)
    (if (= k 0)
        (list empty-board)
        (filter
         (lambda (positions) (safe? k positions))
         (flatmap
          (lambda (rest-of-queens)
            (map (lambda (new-row) (adjoin-position new-row k rest-of-queens))
                 (enumerate-interval 1 board-size)))
          (queen-cols (- k 1))))))
  (queen-cols board-size))