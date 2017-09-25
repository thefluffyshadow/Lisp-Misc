;; Zachary Champion - CS 3210 - Fall 2017
;; =================================================================================================
;; twin function:  duplicates all items in a list
;; Arguments:
;;    * lst - a list of items
;; Assumptions:
;;    * lst is not a nested list

;; untwin function:  takes out any pairs in a list
;; Arguments:
;;    * lst - a list of items
;; Assumptions:
;;    * a "pair" is an adjacent identical pair of items.
;;    * lst is not a nested list
;;    * no more than 2 pairs will be adjacent

(defun twin (lst)
  (cond
    ((NULL lst) nil)
    (t (cons (car lst) (cons (car lst) (twin (cdr lst)))))))

(defun untwin (lst)
  (cond
    ((NULL lst) nil)
    ((equal (car lst) (car (cdr lst))) (cons (car lst) (untwin (cdr (cdr lst)))))
    (t (cons (car lst) (untwin (cdr lst))))))

;; test plan for twin:
;; category/description       data                    expected result
;; -------------------------------------------------------------------------------------------------
;; empty list                 ()                      ()
;; singleton list             (momhesmimicingme)      (momhesmimicingme momhesmimicingme)
;; mixed list                 (potion num 9)          (potion potion num num 9 9)
;; duplicates                 (16 4 4)                (16 16 4 4 4 4)

(setf empty '())
(setf singleton '(momhesmimicingme))
(setf mixed '(potion num 9))
(setf duplicates '(16 4 4))

;; test plan for untwin:
;; category/description       data                    expected result
;; -------------------------------------------------------------------------------------------------
;; empty list                 ()                      ()
;; no duplicates              (1 2 4 plutonium)       (1 2 4 plutonium)
;; all duplicates             (16 16 4 4 2 2)         (16 4 2)
;; some duplicates            (1 1 caffeine 4 8 8)    (1 caffeine 4 8)

(setf noduplicates '(1 2 4 plutonium))
(setf allduplicates '(16 16 4 4 2 2))
(setf someduplicates '(1 1 caffeine 4 8 8))
