#lang sicp

(#%require sicp-pict)

(define sub-vect vector-sub)

(define (transform-painter painter origin corner1 corner2)
  (lambda (frame)
    (let ((m (frame-coord-map frame)))
      (let ((new-origin (m origin)))
        (painter (make-frame
                  new-origin
                  (sub-vect (m corner1) new-origin)
                  (sub-vect (m corner2) new-origin)))))))

(define (flip-horiz painter)
  (transform-painter painter
                     (make-vect 1 0)
                     (make-vect 0 0)
                     (make-vect 1 1)))

(paint einstein)
(paint (flip-horiz einstein))
(paint (transform-painter (flip-horiz einstein)
                          (make-vect 1 1)
                          (make-vect 0 1)
                          (make-vect 1 0)))
(paint (transform-painter (flip-horiz einstein)
                          (make-vect 0 1)
                          (make-vect 0 0)
                          (make-vect 1 1)))