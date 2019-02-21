#lang sicp

(define (entry tree) (car tree))
(define (left-branch tree) (cadr tree))
(define (right-branch tree) (caddr tree))
(define (make-tree entry left right)
  (list entry left right))

(define key car)
(define make-record list)

(define (lookup given-key set-of-records)
  (cond ((null? set-of-records) false)
        ((equal? given-key (key (entry set-of-records)))
         (entry set-of-records))
        ((< given-key (key (entry set-of-records)))
         (lookup given-key (left-branch set-of-records)))
        (else (lookup given-key (right-branch set-of-records)))))

(define tree-B
  (make-tree (make-record 2 'a)
             (make-tree (make-record -3 'b) '() '())
             (make-tree (make-record 8 'c)
                        (make-tree (make-record 5 'd) '() '())
                        (make-tree (make-record 9 'e 'f) '() (make-tree (make-record 13 'k 'q 'a) '() '())))))

(display (lookup 3 tree-B))
(newline)
(display (lookup 2 tree-B))
(newline)
(display (lookup -3 tree-B))
(newline)
(display (lookup 13 tree-B))
(newline)
(display (lookup 14 tree-B))

