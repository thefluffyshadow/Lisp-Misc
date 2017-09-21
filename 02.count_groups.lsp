;; Zachary Champion - CS 3210 - Fall 2017
;; =================================================================================================
;; count_groups function:
;;    Given a list, count the number of groups (a group is two or more identical adjecent items).
;; Parameters:
;; * lst - a list of strings and/or numbers.
;; Assumptions:
;; * The list contains no nested lists.
;;

(defun count-groups (lst)
   (defun eat-group (name lst)
      (cond
        ((NULL lst) nil)
        ((equal (car lst) name) (eat-group name (cdr lst)))
        (t lst)))

   (cond
      ((NULL lst) 0)
      ((equal (car lst) (car (cdr lst))) (+ 1 (count-groups (eat-group (car lst) (cdr lst)))))
      (t (+ 0 (count-groups (cdr lst))))))

;; Test plan:
;; Category/Description     Data                              Expected Result
;; -------------------------------------------------------------------------------------------------
;; empty list               ()                                0
;; no groups                (a b c)                           0
;; one small group          (here kitty kitty)                1
;; 2 groups                 (happy happy joy joy)             2
;; mixed data with groups   (yes no no 23 -101 yes yes yes)   2
;; one big group            (7 7 7 7 7 7 7)                   1
;; many groups              (1 1 2 2 3 3 pi 4 4 5 5 6 6 6)    6

(setf empty_list '())
(setf abc '(a b c))
(setf kitty '(here kitty kitty))
(setf joy '(happy happy joy joy))
(setf mixed '(yes no no 23 -101 yes yes yes))
(setf jackpot '(7 7 7 7 7 7 7))
(setf many '(1 1 2 2 3 3 pi 4 4 5 5 6 6 6))
