;; Zachary Champion - CS 3210 - Fall 2017
;; =================================================================================================
;; is-almost-sorted function:
;;    Takes a list of integers and returns true or nil for if the list is almost sorted (>80%) in
;;    ascending order, but not completely sorted.
;;    Parameters:
;;       * lst - list of integers
;;    Assumptions:
;;       * The list contains no duplicates.

;; is sorted function:
;;    Takes a list of integers and returns true or nil for if the list is completely sorted in
;;    ascending order.
;;    Parameters:
;;       * lst - list of integers
;;    Assumptions:
;;       * The list contains no duplicates.

;; inversions function:
;;    Takes a list of integers and counts how many inversions are present in the list. An inversion
;;    is defined as a pair of adjecent integers in the wrong order (i.e. descending order, in this
;;    case).
;;    Parameters:
;;       * lst - list of integers
;;    Assumptions:
;;       * The list has no duplicates.

(defun is-almost-sorted (lst)
   (cond
     ((is-sorted lst) nil)
     ((< (count-inversions lst) (* 0.2 (length lst))) t)
     (t nil)))

(defun is-sorted (lst)
   (cond
     ((= 0 (count-inversions lst)) t)
     (t nil)))

(defun count-inversions (lst)
   (cond
     ((< (length lst) 2) 0)
     ((> (car lst) (car (cdr lst))) (+ 1 (count-inversions (cdr lst))))
     (t (count-inversions (cdr lst)))))

;; is-almost-sorted test plan:
;; category/description                      data                                   expected result
;; -------------------------------------------------------------------------------------------------
;; empty list                                ()                                     nil
;; singleton                                 (8)                                    nil
;; completely sorted                         (1 2 3 5 8 13 21 34 55)                nil
;; greater than 20%                          (1 2 4 3)                              nil
;; exactly 20%                               (1 2 4 3 5)                            nil
;; less than 20%                             (1 2 4 3 5 6)                          t
;; long list                                 (1 2 3 5 8 13 144 21 34 55 89 42)      t
;; completely inverted                       (5 4 3 2 1)                            nil

;; is-sorted test plan:
;; category/description                      data                                   expected result
;; -------------------------------------------------------------------------------------------------
;; empty list                                ()                                     t
;; singleton                                 (8)                                    t
;; completely sorted                         (1 2 3 5 8 13 21 34 55)                t
;; almost sorted                             (1 2 3 4 5 7 6)                        nil
;; completely inverted                       (5 4 3 2 1)                            nil

;; count-inversions test plan:
;; category/description                      data                                   expected result
;; -------------------------------------------------------------------------------------------------
;; empty list                                ()                                     0
;; singleton                                 (8)                                    0
;; completely sorted                         (1 2 3 5 8 13 21 34 55)                0
;; greater than 20%                          (1 2 4 3)                              1
;; exactly 20%                               (1 2 4 3 5)                            1
;; less than 20%                             (1 2 4 3 5 6)                          1
;; long list                                 (1 2 3 5 8 13 144 21 34 55 89 42)      2
;; completely inverted                       (5 4 3 2 1)                            4

(setf empty '())
(setf singleton '(8))
(setf completely-sor '(1 2 3 5 8 13 21 34 55))
(setf greater '(1 2 4 3))
(setf exactly '(1 2 4 3 5))
(setf less '(1 2 4 3 5 6))
(setf long '(1 2 3 5 8 13 144 21 34 55 89 42))
(setf completely-inv '(5 4 3 2 1))
