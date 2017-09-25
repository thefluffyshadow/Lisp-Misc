;; Zachary Champion - CS 3210 - Fall 2017
;; =================================================================================================
;; match function: returns how many times a given integer is in a list of integers.
;; Parameters:
;;    * i - the wanted integer
;;    * lst - the list to search in
;; Assumptions:
;;    * the list contains only integers
;;    * the number to search for is an integer

(defun match (i lst)
  (cond
    ((NULL lst) 0)
    ((listp (car lst)) (+ (match i (car lst)) (match i (cdr lst))))
    ((= (car lst) i) (+ 1 (match i (cdr lst))))
    (t (match i (cdr lst)))))

;; test plan for match:
;; category/description                   data {i,lst}                              expected result
;; -------------------------------------------------------------------------------------------------
;; empty list                             {8, ()}                                   0
;; i not in lst                           {8, (1 2 3 4 5)}                          0
;; i in lst                               {8, (1 2 4 8 4)}                          1
;; i not in nested lst                    {8, (1 2 3 (4 5 (6 7 4)))}                0
;; i in nested lst                        {8, (8 8 (2 5 4 (8) 76) 9 (8))}           4
;; very nested lst                        {8, (((8 8)(8 8))((8 8)(8 8)))}           8

(setf i 8)
(setf emptylst '())
(setf inotinlst '(1 2 3 4 5))
(setf iinlst '(1 2 4 8 4))
(setf inotinnestedlst '(1 2 3 (4 5 (6 7 4))))
(setf iinnestedlst '(8 8 (2 5 4 (8) 76) 9 8))
(setf verynestedlst '(((8 8)(8 8))((8 8)(8 8))))
