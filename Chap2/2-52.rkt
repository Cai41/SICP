#lang sicp

(#%require sicp-pict)

(define wave
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
         (make-segment (make-vect 0.50 0.30) (make-vect 0.40 0.00))
         (make-segment (make-vect 0.50 0.30) (make-vect 0.30 0.50)))))

(define (up-split painter n)
  (if (= n 0)
      painter
      (let ((smaller (up-split painter (- n 1))))
        (below painter (beside smaller smaller)))))

(define (right-split painter n)
  (if (= n 0)
      painter
      (let ((smaller (right-split painter (- n 1))))
        (beside painter (below smaller smaller)))))

(define (corner-split painter n)
  (if (= n 0)
      painter
      (let ((up (up-split painter (- n 1)))
            (right (right-split painter (- n 1))))
        (let ((top-left (below up up))
              (bottom-right (beside right right))
              (corner (corner-split painter (- n 1))))
          (beside (below painter top-left)
                  (below bottom-right corner))))))

(define (square-of-four tl tr bl br)
  (lambda (painter)
    (let ((top (beside (tl painter) (tr painter)))
          (bottom (beside (bl painter) (br painter))))
      (below bottom top))))

(define (square-limit painter n)
  (let ((combine4 (square-of-four identity flip-horiz
                                  flip-horiz rotate180)))
    (combine4 (corner-split painter n))))

(paint (corner-split wave 3))
(paint (square-limit wave 3))