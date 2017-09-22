;; Zachary Champion - CS 3210 - Fall 2017
;; =================================================================================================
;; enforce-limit function:
;;    A function that produces a new list in which all values originally over the limit are replaced
;;    by the limit. Nested lists remain nested.
;;    Parameters:
;;       * An integer as an upper limit.
;;       * A list on which to enforce the limit.
;;    Assumptions:
;;       * The limit will be an integer.

;; proc_num function:
;;    A function that takes a limit and a number and replaces the number by the limit if the number
;;    is over the limit.
;; Parameters:
;;    * An integer as an upper limit.
;;    * A list on which to enforce the limit.
;; Assumptions:
;;    * The limit will be an integer.

(defun enforce-limit (limit lst)
   (cond
     ((NULL lst) nil)
     ((numberp (car lst)) (cons (proc_num limit (car lst)) (enforce-limit limit (cdr lst))))
     (t (cons (car lst) (enforce-limit limit (cdr lst))))))

(defun proc_num (limit num)
   (cond
     ((< limit num) limit)
     (t num)))

;; enforce-limit test plan:
;; category/description       data                    expected result
;; -------------------------------------------------------------------------------------------------
;; empty list                 10, ()                           NIL
;; negative limit             -4, (-8 4 0 1 -2)                (-8 -4 -4 -4 -4)
;; small list                 10,  (1 2 3 4 5 15 16 17 18 19)  (1 2 3 4 5 5 5 5 5)
;; normal limit               10, (1 2 3 4 5 15 16 17 18 19)   (1 2 3 3 3 3 3 3 3)
;; words                      10,  (1 2 3 mercy 456 t)         (1 2 3 mercy 10 t)

(setf empty-list '())
(setf neglimit-list '(-8 4 0 1 -2))
(setf norm-list '(1 2 3 4 5 15 16 17 18 19))
(setf word-list '(1 2 3 mercy 456 t))

;; proc_num test plan:
;; category/description       data                    expected result
;; -------------------------------------------------------------------------------------------------
;; limit < neg number        -8, -4                   -8
;; limit > number             4, 2                    2
;; limit = number             4, 4                    4
;; limit < number             4, 8                    4
