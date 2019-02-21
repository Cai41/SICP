#lang sicp

(define (entry tree) (car tree))
(define (left-branch tree) (cadr tree))
(define (right-branch tree) (caddr tree))
(define (make-tree entry left right)
  (list entry left right))

(define (list->tree elements)
  (car (partial-tree elements (length elements))))

(define (partial-tree elts n)
  (if (= n 0)
      (cons '() elts)
      (let ((left-size (quotient (- n 1) 2)))
        (let ((left-result
               (partial-tree elts left-size)))
          (let ((left-tree (car left-result))
                (non-left-elts (cdr left-result))
                (right-size (- n (+ left-size 1))))
            (let ((this-entry (car non-left-elts))
                  (right-result
                   (partial-tree
                    (cdr non-left-elts)
                    right-size)))
              (let ((right-tree (car right-result))
                    (remaining-elts
                     (cdr right-result)))
                (cons (make-tree this-entry
                                 left-tree
                                 right-tree)
                      remaining-elts))))))))

(define (tree->list-2 tree)
  (define (copy-to-list tree result-list)
    (if (null? tree)
        result-list
        (copy-to-list (left-branch tree)
                      (cons (entry tree)
                            (copy-to-list
                             (right-branch tree)
                             result-list)))))
  (copy-to-list tree '()))

(define (union-list list1 list2)
  (cond ((null? list1) list2)
        ((null? list2) list1)
        (else (let ((x1 (car list1)) (x2 (car list2)))
                (cond ((= x1 x2)
                       (cons x1 (union-list (cdr list1)
                                           (cdr list2))))
                      ((< x1 x2)
                       (cons x1 (union-list (cdr list1) list2)))
                      ((< x2 x1)
                       (cons x2 (union-list list1 (cdr list2)))))))))

(define (set-operation op)
  (lambda (set1 set2)
    (let ((list-1 (tree->list-2 set1))
          (list-2 (tree->list-2 set2)))
      (let ((combined-list (op list-1 list-2)))
        (list->tree combined-list)))))

(define union-set (set-operation union-list))

(define (intersection-list list1 list2)
  (if (or (null? list1) (null? list2))
      '()
      (let ((x1 (car list1)) (x2 (car list2)))
        (cond ((= x1 x2)
               (cons x1 (intersection-list (cdr list1)
                                          (cdr list2))))
              ((< x1 x2)
               (intersection-list (cdr list1) list2))
              ((< x2 x1)
               (intersection-list list1 (cdr list2)))))))

(define intersection-set (set-operation intersection-list))

(define tree-A
  (make-tree 7
             (make-tree 3 (make-tree 0 '() '()) (make-tree 6 '() '()))
             (make-tree 9 '() (make-tree 11 '() '()))))

(define tree-B
  (make-tree 2
             (make-tree -3 '() '())
             (make-tree 8
                        (make-tree 5 '() '())
                        (make-tree 9 '() (make-tree 13 '() '())))))

(define tree-C
  (make-tree 5
             (make-tree 4 (make-tree 1 '() '()) '())
             (make-tree 10
                        (make-tree 7 '() '())
                        (make-tree 11 '() '()))))

(display (intersection-set tree-A tree-B))
(newline)
(display (union-set tree-A tree-B))
(newline)
(display (intersection-set tree-A tree-C))
(newline)
(display (union-set tree-A tree-C))