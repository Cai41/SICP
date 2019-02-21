#lang sicp

;; To add new type
;;  1). For explicit dispatch, we have to write all functions for this new data, tags for new data, and then add these functions to each generic function
;;  2). For data directed style, we have to write all new functions and data tags in the new module, the we need to insert these functions into table
;;  3). For messaging passing style, we have to write all new functions, and then we need put these functins into single data object, so that the operations will be dispatched to the single data object
;; To add new operations
;;  1). For explicit dispatch, we need to write functions for all data type, and the write generic operation that explicity dispatch the operations
;;  2). For data directed style, we have to add new function to each module, then insert then into table
;;  3). For messaging passing style, we have to add new function to cond clause for each data type

;; If new data are frequently added, we better use message passing
;; If operations are always added, we better use data directed style
