#lang sicp

(define (variable? x) (symbol? x))
(define (same-variable? v1 v2)
  (and (variable? v1) (variable? v2) (eq? v1 v2)))
(define (=number? exp num) (and (number? exp) (= exp num)))

(define (make-sum a1 a2)
  (cond ((=number? a1 0) a2)
        ((=number? a2 0) a1)
        ((and (number? a1) (number? a2))
         (+ a1 a2))
        (else (list '+ a1 a2))))
(define (make-product m1 m2)
  (cond ((or (=number? m1 0) (=number? m2 0)) 0)
        ((=number? m1 1) m2)
        ((=number? m2 1) m1)
        ((and (number? m1) (number? m2)) (* m1 m2))
        (else (list '* m1 m2))))
(define (make-exponentiation b e)
  (cond ((=number? e 0) 1)
        ((=number? e 1) b)
        ((and (number? b) (number? e))
         (expt b e))
        (else (list '** b e))))
(define (sum? x) (and (pair? x) (eq? (car x) '+)))
(define (addend s) (car s))
(define (augend s) (cadr s))
(define (product? x) (and (pair? x) (eq? (car x) '*)))
(define (multiplier p) (car p))
(define (multiplicand p) (cadr p))
(define (exponentiation? x) (and (pair? x) (eq? (car x) '**)))
(define (base x) (car x))
(define (exponent x) (cadr x))

(define (make-table) 
  (let ((local-table (list '*table*)))
    (define (lookup key-1 key-2)
      (let ((subtable (assoc key-1 (cdr local-table))))
        (if subtable
            (let ((record (assoc key-2 (cdr subtable))))
              (if record
                  (cdr record)
                  false))
            false)))
    (define (insert! key-1 key-2 value)
      (let ((subtable (assoc key-1 (cdr local-table))))
        (if subtable
            (let ((record (assoc key-2 (cdr subtable))))
              (if record
                  (set-cdr! record value)
                  (set-cdr! subtable
                            (cons (cons key-2 value) (cdr subtable)))))
            (set-cdr! local-table
                      (cons (list key-1 (cons key-2 value)) (cdr local-table)))))
      'OK)
    (define (dispatch m)
      (cond ((eq? m 'lookup-proc) lookup)
            ((eq? m 'insert-proc) insert!)
            (else (error "Unknown operation -- TABLE" m))))
    dispatch))
(define operation-table (make-table))
(define get (operation-table 'lookup-proc))
(define put (operation-table 'insert-proc))

(define (install-sum-deriv-package)
  (define (deriv-sum exp var)
    (make-sum (deriv (addend exp) var)
              (deriv (augend exp) var)))
  (put 'deriv '+ deriv-sum)
  'done)

(define (install-product-deriv-package)
  (define (deriv-product exp var)
    (make-sum (make-product
               (multiplier exp)
               (deriv (multiplicand exp) var))
              (make-product
               (deriv (multiplier exp) var)
               (multiplicand exp))))
  (put 'deriv '* deriv-product)
  'done)

(define (install-exponentiation-deriv-package)
  (define (deriv-exponentiation exp var)
    (make-product (make-product (exponent exp)
                                (make-exponentiation (base exp)
                                                     (- (exponent exp) 1)))
                  (deriv (base exp) var)))
  (put 'deriv '** deriv-exponentiation)
  'done)

(install-sum-deriv-package)
(install-product-deriv-package)
(install-exponentiation-deriv-package)

(define (deriv exp var)
  (cond ((number? exp) 0)
        ((variable? exp) (if (same-variable? exp var) 1 0))
        (else ((get 'deriv (operator exp))
               (operands exp) var))))
(define (operator exp) (car exp))
(define (operands exp) (cdr exp))

;; a). We get the deriv function of an data type, and call that function with arguments provided
;;     Because there is no operator and operands for number and variable

(display (deriv '(* x (+ (* 5 x) x)) 'x))
(newline)
(display (deriv '(** x 3) 'x))
;; d). We need to swap the order of arguments of both get and put