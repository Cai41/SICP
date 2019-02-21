#lang sicp

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

(define division car)
(define content cdr)
;; File should have divison type inside
(define (get-record employee-name file)
  ((get 'get-records (division file))
   employee-name (content file)))

;; Record should have division type inside
(define (get-salary record)
  ((get 'get-salary (division record)) (content record)))

(define (find-employee-record employee-name files)
  (if (null? files)
      #f
      (let ((record (get-record employee-name (car files))))
        (if record
            record
            (find-employee-record employee-name (cdr files))))))

;; d.) We hvae to insert all the specified functions into the table, keyed by function name and new divison name

