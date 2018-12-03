#lang sicp

;; First approach takes one element from head of remaining list, but insert at the head of answer. It should be inserting at the end of answer.

;; Second one cons the list with the element (cons list element)

(define (square x) (* x x))

(define (square-list items)
  (define (iter things answer)
    (if (null? things)
        answer
        (iter (cdr things)
                  (append answer
                        (square (car things))))))
  (iter items nil))

(define (append list x)
  (if (null? list)
      (cons x nil)
      (cons (car list) (append (cdr list) x))))

(display (square-list (list 1 2 3 4)))
