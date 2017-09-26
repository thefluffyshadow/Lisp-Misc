;; Zachary Champion - CS 3210 - Fall 2017
;; =================================================================================================
;; make-recent function:  Takes a word and list of words. If the word is not in the list, it is
;; added at the beginning of the list. If the word is in the list, its position is changed to be
;; first in the list. In both cases, the word most recently added is now at the front of the list.
;; Parameters:
;;    wrd - a string
;;    lst - a list of words
;; Assumptions:
;;    1. The incoming list has no duplicates.

;; clean function: Helper function to make-recent. Takes in a word to filter and a list of words and
;; returns the list after the filtered word.
;; Parameters:
;;    wrd - a string to look for.
;;    lst - a list of words.
;; Assumptions:
;;    1. The incoming list has no duplicates.

(defun make-recent (wrd lst)
   (cons wrd (remove wrd lst)))

(defun clean (wrd lst)
   (cond
      ((NULL lst) lst)
      ((equal wrd (car lst)) (cdr lst))
      (t (clean wrd (cdr lst)))))

;; test plan for make-recent:
;; Category/Description       Data (word, list)                   Expected Result
;; -------------------------------------------------------------------------------------------------
;; empty list                 ("mercy", ())                       (mercy)
;; singleton list             ("mercy", (mercy))                  (mercy)
;; already first              ("mercy", (mercy a came in))        (mercy a came in)
;; word in list               ("mercy", (a mercy came in))        (mercy a came in)
;; word not in list           ("mercy", (cat dog tree))           (mercy cat dog tree)
;; word already last          ("mercy", (roadhog hanzo mercy))    (mercy roadhog hanzo)

;; test plan for clean:
;; Category/Description       Data (word, list)                   Expected Result
;; -------------------------------------------------------------------------------------------------
;; empty list                 ("mercy", ())                       ()
;; singleton list             ("mercy", (mercy))                  ()
;; already first              ("mercy", (mercy a came in))        (a came in)
;; word in list               ("mercy", (a mercy came in))        (came in)
;; word not in list           ("mercy", (cat dog tree))           ()
;; word already last          ("mercy", (roadhog hanzo mercy))    ()

(setf test-word 'mercy)
(setf empty '())
(setf single '(mercy))
(setf already '(mercy a came in))
(setf word '(a mercy came in))
(setf no-word '(cat dog tree))
(setf last '(roadhog hanzo mercy))
