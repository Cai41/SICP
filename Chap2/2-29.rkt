#lang sicp

(define (first list)
  (car list))

(define (second list)
;;  (car (cdr list)))
  (cdr list))

(define (make-mobile left right)
;;  (list left right))
  (cons left right))

(define (make-branch length structure)
;;  (list length structure))
  (cons length structure))

(define (left-branch mobile)
  (first mobile))

(define (right-branch mobile)
  (second mobile))

(define (branch-length branch)
  (first branch))

(define (left-branch-length mobile)
  (branch-length (left-branch mobile)))

(define (right-branch-length mobile)
  (branch-length (right-branch mobile)))

(define (branch-structure branch)
  (second branch))

(define (left-branch-structure mobile)
  (branch-structure (left-branch mobile)))

(define (right-branch-structure mobile)
  (branch-structure (right-branch mobile)))

(define (submobile? structure)
  (not (number? structure)))

(define (total-weight mobile)
  (+ (left-branch-weight mobile)
     (right-branch-weight mobile)))

(define (left-branch-weight mobile)
  (branch-weight (left-branch mobile)))

(define (right-branch-weight mobile)
  (branch-weight (right-branch mobile)))

(define (branch-weight branch)
  (let ((structure (branch-structure branch)))
    (if (submobile? structure)
        (total-weight structure)
        structure)))

(total-weight (make-mobile (make-branch 4
                                        (make-mobile (make-branch 1 11)
                                                     (make-branch 3 7)))
                           (make-branch 12
                                        (make-mobile (make-branch 3
                                                                  (make-mobile (make-branch 3 25)
                                                                               (make-branch 3
                                                                                            (make-mobile (make-branch 3 13)
                                                                                                         (make-branch 1 5)))))
                                                     (make-branch 4 51)))))

(define (balanced? mobile)
  (define (structure-balanced? structure)
    (or (not (submobile? structure))
        (balanced? structure)))
  (let ((mobile-left-structure (left-branch-structure mobile))
        (mobile-right-structure (right-branch-structure mobile)))
    (and (= (* (left-branch-weight mobile) (left-branch-length mobile))
            (* (right-branch-weight mobile) (right-branch-length mobile)))
         (structure-balanced? mobile-left-structure)
         (structure-balanced? mobile-right-structure))))

(display (balanced? (make-mobile (make-branch 2
                                              (make-mobile (make-branch 2 9)
                                                           (make-branch 3 6)))
                                 (make-branch 10 3))))

(newline)

(display (balanced? (make-mobile (make-branch 2
                                              (make-mobile (make-branch 2 9)
                                                           (make-branch 3 6)))
                                 (make-branch 11 3))))

(newline)

(display (balanced? (make-mobile (make-branch 2
                                              (make-mobile (make-branch 2 8)
                                                           (make-branch 3 6)))
                                 (make-branch 14 2))))
  
