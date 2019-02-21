#lang sicp

(#%require sicp-pict)

(define a-painter (segments->painter (list (make-segment (make-vect 0 0) (make-vect 0 1))
                                           (make-segment (make-vect 0 1) (make-vect 1 1))
                                           (make-segment (make-vect 1 1) (make-vect 1 0))
                                           (make-segment (make-vect 1 0) (make-vect 0 0)))))

(paint a-painter)

(define b-painter (segments->painter (list (make-segment (make-vect 0 0) (make-vect 1 1))
                                           (make-segment (make-vect 1 0) (make-vect 0 1)))))

(paint b-painter)

(define c-painter (segments->painter (list (make-segment (make-vect 0 0.5) (make-vect 0.5 1))
                                           (make-segment (make-vect 0.5 1) (make-vect 1 0.5))
                                           (make-segment (make-vect 1 0.5) (make-vect 0.5 0))
                                           (make-segment (make-vect 0.5 0) (make-vect 0 0.5)))))

(paint c-painter)

(define d-painter
  (segments->painter
   (list (make-segment (make-vect 0.35 0.85) (make-vect 0.40 1.00))
         (make-segment (make-vect 0.65 0.85) (make-vect 0.60 1.00))
         (make-segment (make-vect 0.35 0.85) (make-vect 0.40 0.65))
         (make-segment (make-vect 0.65 0.85) (make-vect 0.60 0.65))
         (make-segment (make-vect 0.60 0.65) (make-vect 0.75 0.65))
         (make-segment (make-vect 0.40 0.65) (make-vect 0.30 0.65))
         (make-segment (make-vect 0.75 0.65) (make-vect 1.00 0.35))
         (make-segment (make-vect 0.60 0.45) (make-vect 1.00 0.15))
         (make-segment (make-vect 0.60 0.45) (make-vect 0.75 0.00))
         (make-segment (make-vect 0.50 0.30) (make-vect 0.60 0.00))
         (make-segment (make-vect 0.30 0.65) (make-vect 0.15 0.60))
         (make-segment (make-vect 0.30 0.60) (make-vect 0.15 0.40))
         (make-segment (make-vect 0.15 0.60) (make-vect 0.00 0.85))
         (make-segment (make-vect 0.15 0.40) (make-vect 0.00 0.65))
         (make-segment (make-vect 0.30 0.60) (make-vect 0.35 0.50))
         (make-segment (make-vect 0.35 0.50) (make-vect 0.25 0.00))
         (make-segment (make-vect 0.50 0.30) (make-vect 0.40 0.00)))))

(paint d-painter)
