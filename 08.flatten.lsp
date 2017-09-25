;; Zachary Champion - CS 3210 - Fall 2017
;; =================================================================================================
;; flatten function: takes a possibly nested list and returns all of the elements at the top level
;; Parameters:
;;    * lst - a list of items
;; Assumptions:
;;    * No assumptions about the parameters

(defun flatten (lst)
  (cond
    ((NULL lst) nil)
    ((listp (car lst)) (append (flatten (car lst)) (flatten (cdr lst))))
    (t (cons (car lst) (flatten (cdr lst))))))

;; test plan for flatten:
;; category/description       data                          expected result
;; -------------------------------------------------------------------------------------------------
;; empty list                 ()                            NIL
;; nested empty list          ((()))                        NIL
;; nested singleton           ((((4))))                     (4)
;; non-nested list            (Hera Zeus Hades)             (HERA ZEUS HADES)
;; nested list                (1 (2 (3) (3 (4 (5 5))) 2))   (1 2 3 3 4 5 5 2)

(setf empty '())
(setf nestedempty '((())))
(setf nestedsingle '((((4)))))
(setf nonnested '(Hera Zeus Hades))
(setf nested '(1 (2 (3) (3 (4 (5 5))) 2)))
