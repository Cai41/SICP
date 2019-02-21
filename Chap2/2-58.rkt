#lang sicp

(define (deriv exp var)
  (cond ((number? exp) 0)
        ((variable? exp) (if (same-variable? exp var) 1 0))
        ((sum? exp) (make-sum (deriv (addend exp) var)
                              (deriv (augend exp) var)))
        ((product? exp)
         (make-sum
          (make-product (multiplier exp)
                        (deriv (multiplicand exp) var))
          (make-product (deriv (multiplier exp) var)
                        (multiplicand exp))))
        (else
         (error "unknown expression type: DERIV" exp))))

(define (variable? x) (symbol? x))

(define (same-variable? v1 v2)
  (and (variable? v1) (variable? v2) (eq? v1 v2)))

(define (=number? exp num) (and (number? exp) (= exp num)))

;;(define (make-sum a1 a2)
;;  (cond ((=number? a1 0) a2)
;;        ((=number? a2 0) a1)
;;        ((and (number? a1) (number? a2))
;;         (+ a1 a2))
;;        (else (list a1 '+ a2))))
;;
;;(define (make-product m1 m2)
;;  (cond ((or (=number? m1 0) (=number? m2 0)) 0)
;;        ((=number? m1 1) m2)
;;        ((=number? m2 1) m1)
;;        ((and (number? m1) (number? m2)) (* m1 m2))
;;        (else (list m1 '* m2))))
;;
;;(define (sum? x) (and (pair? x) (eq? (cadr x) '+)))
;;(define (addend s) (car s))
;;(define (augend s) (caddr s))
;;
;;(define (product? x) (and (pair? x) (eq? (cadr x) '*)))
;;(define (multiplier p) (car p))
;;(define (multiplicand p) (caddr p))
;;
;;(deriv '(x + (3 * (x + (y + 2)))) 'x)

(define (wrap-list a)
  (if (pair? a)
      (list a)
      a))

(define (make-sum a1 a2)
  (cond ((=number? a1 0) a2)
        ((=number? a2 0) a1)
        ((and (number? a1) (number? a2))
         (+ a1 a2))
        (else (append (wrap-list a1)
                      (wrap-list '+)
                      (wrap-list a2)))))

(define (make-product m1 m2)
  (cond ((or (=number? m1 0) (=number? m2 0)) 0)
        ((=number? m1 1) m2)
        ((=number? m2 1) m1)
        ((and (number? m1) (number? m2)) (* m1 m2))
        (else (append (wrap-list m1)
                      (wrap-list '*)
                      (wrap-list m2)))))

(define (sum? x) (and (pair? x)
                      (not (null? (cdr x)))
                      (or (eq? (cadr x) '+)
                          (sum? (cddr x)))))
(define (addend s)
  (define (recur prev post)
    (if (eq? (car post) '+)
        prev
        (recur (append prev (list (car post))) (cdr post))))
  (let ((res (recur '() s)))
    (if (null? (cdr res))
        (car res)
        res)))

(define (augend s)
  (let ((res(if (eq? (cadr s) '+)
                (cddr s)
                (augend (cddr s)))))
    (if (null? (cdr res))
        (car res)
        res)))
  
(define (product? x) (and (pair? x)
                          (and (eq? (cadr x) '*)
                               (or (null? (cdddr x))
                                   (product? (cddr x))))))
(define (multiplier p) (car p))
(define (multiplicand p)
  (if (null? (cdddr p))
      (caddr p)
      (cons '* (cddr p))))

(deriv '(x + 3 * (x + y + 2)) 'x)