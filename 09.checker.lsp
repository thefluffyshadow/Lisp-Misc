;; Zachary Champion - CS 3210 - Fall 2017
;; =================================================================================================
;; checker function: checks the syntax of a list of math operations
;; Parameters:
;;    * expression - a possibly nested list of mathematical expressions
;; Assumpions:
;;    * No assumpions about incoming parameters

;; token-number-check function:
;; Parameters:
;;    * expression - a possibly nested list of mathematical expressions
;; Assumpions:

;; numeric-operand-check function:
;; Parameters:
;;    * expression - a possibly nested list of mathematical expressions
;; Assumpions:
;;    * expression has passed the token-number-check and therefore has 3 tokens

;; valid-operator-check function:
;; Parameters:
;;    * expression - a possibly nested list of mathematical expressions
;; Assumpions:
;;    * expression has passed the token-number-check and therefore has 3 tokens
;;    * expression has passed the numeric-operand-check and therefore has numeric operands

(defun checker (expression) nil)

(defun token-number-check (expression) nil)

(defun numeric-operand-check (expression) nil)

(defun valid-operator-check (expression) nil)

;; checker test plan:
;; category/description       data                                      expected result
;; -------------------------------------------------------------------------------------------------
;; empty expression           ()                                        NIL
;; ordinary                   (7 plus 11)                               T
;; nested expression          (25 minus (17 times 12))                  T
;; double nested              ((100 plus 200) dividedby (17 times 5))   T
;; wrong operand number       (-4 plus)                                 NIL
;; non-numeric operands       (535 times (man plus pig))               NIL
;; invalid operator           (3 + 2)                                   NIL
;; abomination                (fifty-five * (iron plus pen))            NIL

(setf empty '())
(setf ordinary '(7 plus 11))
(setf nested '(25 minus (17 times 12)))
(setf double-nested '(100 plus200 dividedby (17 times 5)))
(setf wrong-operand-number '(-4 plus))
(setf non-numeric-operands '(535 times (man plus pig)))
(setf invalid-operator '(3 + 2))
(setf abomination '(fifty-five * (iron plus pen)))

;; token-number-check test plan:
;; category/description       data                                      expected result
;; -------------------------------------------------------------------------------------------------
;; empty expression           ()                                        NIL
;; too few tokens             (-4 plus)                                 NIL
;; 3 wrong tokens             (3 + 2)                                   T
;; 3 right tokens             (7 plus 11)                               T
;; too many tokens            (too many voices in my head)              NIL

(setf too-few wrong-operand-number)
(setf 3-wrong invalid-operator)
(setf 3-right ordinary)
(setf too-many '(too many voices in my head))

;; numeric-operand-check test plan:
;; category/description       data                                      expected result
;; -------------------------------------------------------------------------------------------------

;; valid-operator-check test plan:
;; category/description       data                                      expected result
;; -------------------------------------------------------------------------------------------------
