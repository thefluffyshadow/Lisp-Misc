;; Zachary Champion - CS 3210 - Fall 2017
;; =================================================================================================
;; make-recent function:
;; Takes a word and list of words. If the word is not in the list, it is added at the beginning of
;; the list. If the word is in the list, its position is changed to be first in the list. In both
;; cases, the word most recently adde is now at the front of the list.
;; Parameters:
;; * wrd - a string
;; * lst - a list of words
;; Assumptions:
;; * The incoming list has no duplicates.

(defun make-recent (wrd lst)
   (cond
     ((NULL lst) (list wrd))
     ((equal wrd (car lst)) (cons wrd (car (cdr lst))))
     (t (make-recent wrd (cdr lst)))))

;; Test plan:
;; Category/Description     Data (word, list)                  Expected Result
;; -------------------------------------------------------------------------------------------------
;; empty list               ("mercy", ())                      (mercy)
;; word in list             ("cat", (a cat came in))           (cat a came in)
;; word not in list         ("boy", (cat dog tree))            (boy cat dog tree)

(setf test-word "mercy")

(setf empty '())
(setf single '(mercy))
(setf word '(a mercy came in))
(setf no-word '(cat dog tree))
(setf first '(mercy roadhog hanzo))
(setf last '(roadhog hanzo mercy))

;; Test section DELETE BEFORE TURNING IN
(print (make-recent test-word empty))
(print (make-recent test-word single))
(print (make-recent test-word word))
(print (make-recent test-word no-word))
(print (make-recent test-word first))
(print (make-recent test-word last))
