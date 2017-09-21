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
   )

;; Test plan:
;; Category/Description     Data (word, list)                  Expected Result
;; -------------------------------------------------------------------------------------------------
;; empty list               ("mercy", ())                      (mercy)
;; word in list             ("cat", (a cat came in))           (cat a came in)
;; word not in list         ("boy", (cat dog tree))            (boy cat dog tree)
