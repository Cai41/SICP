#lang sicp

(define (entry tree) (car tree))
(define (left-branch tree) (cadr tree))
(define (right-branch tree) (caddr tree))
(define (make-tree entry left right)
  (list entry left right))

(define (tree->list-1 tree)
  (if (null? tree)
      '()
      (append (tree->list-1 (left-branch tree))
              (cons (entry tree)
                    (tree->list-1
                     (right-branch tree))))))

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

(define tree-A
  (make-tree 7
             (make-tree 3 (make-tree 1 '() '()) (make-tree 5 '() '()))
             (make-tree 9 '() (make-tree 11 '() '()))))

(define tree-B
  (make-tree 3
             (make-tree 1 '() '())
             (make-tree 7
                        (make-tree 5 '() '())
                        (make-tree 9 '() (make-tree 11 '() '())))))

(define tree-C
  (make-tree 5
             (make-tree 3 (make-tree 1 '() '()) '())
             (make-tree 9
                        (make-tree 7 '() '())
                        (make-tree 11 '() '()))))
                        

(display (tree->list-1 tree-A))
(newline)
(display (tree->list-2 tree-A))
(newline)
(display (tree->list-1 tree-B))
(newline)
(display (tree->list-2 tree-B))
(newline)
(display (tree->list-1 tree-C))
(newline)
(display (tree->list-2 tree-C))

;; a. They are the same, in-order traversal

;; b. 1). T(n) = 2*T(n/2) + O(n/2) (as the procedure append takes linear time) => O(n * log n)
;;     2).T(n) = 2*T(n/2) + O(1) => O(n)

