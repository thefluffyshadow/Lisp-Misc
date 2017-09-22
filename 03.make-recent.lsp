;; Zachary Champion - CS 3210 - Fall 2017
;; =================================================================================================
;; make-recent function:
;; Takes a word and list of words. If the word is not in the list, it is added at the beginning of
;; the list. If the word is in the list, its position is changed to be first in the list. In both
;; cases, the word most recently added is now at the front of the list.
;; Parameters:
;;    * wrd - a string
;;    * lst - a list of words
;; Assumptions:
;;    * The incoming list has no duplicates.

;; clean function:
;; Helper function to make-recent.
;; Takes in a word to filter and a list of words and returns the list after the filtered word.
;; Parameters:
;;    * wrd - a string to look for.
;;    * lst - a list of words.
;; Assumptions:
;;    *The incoming list has no duplicates.

(defun make-recent (wrd lst)
   (cons wrd (remove wrd lst)))

(defun clean (wrd lst)
   (cond
      ((NULL lst) lst)
      ((equal wrd (car lst)) (cdr lst))
      (t (clean wrd (cdr lst)))))

;; make-recent test plan:
;; Category/Description       Data (word, list)                   Expected Result
;; -------------------------------------------------------------------------------------------------
;; empty list                 ("mercy", ())                       (MERCY)
;; singleton list             ("mercy", (mercy))                  (MERCY)
;; already first              ("mercy", (mercy a came in))        (MERCY A CAME IN)
;; word in list               ("mercy", (a mercy came in))        (MERCY A CAME IN)
;; word not in list           ("mercy", (cat dog tree))           (MERCY CAT DOG TREE)
;; word already last          ("mercy", (roadhog hanzo mercy))    (MERCY ROADHOG HANZO)

;; clean test plan:
;; Category/Description       Data (word, list)                   Expected Result
;; -------------------------------------------------------------------------------------------------
;; empty list                 ("mercy", ())                       ()
;; singleton list             ("mercy", (mercy))                  ()
;; already first              ("mercy", (mercy a came in))        (A CAME IN)
;; word in list               ("mercy", (a mercy came in))        (CAME IN)
;; word not in list           ("mercy", (cat dog tree))           ()
;; word already last          ("mercy", (roadhog hanzo mercy))    ()

(setf test-word 'mercy)

(setf empty '())
(setf single '(mercy))
(setf already '(mercy a came in))
(setf word '(a mercy came in))
(setf no-word '(cat dog tree))
(setf last '(roadhog hanzo mercy))
