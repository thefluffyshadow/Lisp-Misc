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

(defun checker (expression)
   (and (token-number-check expression)
        (numeric-operand-check expression)
        (valid-operator-check expression)))

(defun token-number-check (expression)
   (cond
     ((not (= (length expression) 3)) nil)
     ((listp (car expression)) (token-number-check (car expression)))
     ((listp (car (cdr (cdr expression)))) (token-number-check (car (cdr (cdr expression)))))
     (t t)))

(defun numeric-operand-check (expression)
   (cond
      ((not (or (numberp (car expression)) (numberp (car (cdr (cdr expression)))))) nil)
      ((listp (car expression)) (numeric-operand-check (car expression)))
      ((listp (car (cdr (cdr expression)))) (numeric-operand-check (car (cdr (cdr expression)))))
      (t t)))

(defun valid-operator-check (expression)
   (cond
      ((not (or (equal (car (cdr expression)) 'PLUS)
                (equal (car (cdr expression)) 'MINUS)
                (equal (car (cdr expression)) 'TIMES)
                (equal (car (cdr expression)) 'DIVIDEDBY))) nil)
      ((listp (car expression)) (valid-operator-check (car expression)))
      ((listp (car (cdr (cdr expression)))) (valid-operator-check (car (cdr (cdr expression)))))
      (t t)))

;; checker test plan:
;; category/description       data                                      expected result
;; -------------------------------------------------------------------------------------------------
;; empty expression           ()                                        NIL
;; ordinary                   (7 plus 11)                               T
;; nested expression          (25 minus (17 times 12))                  T
;; double nested              ((100 plus 200) dividedby (17 times 5))   T
;; wrong operand number       (-4 plus)                                 NIL
;; non-numeric operands       (535 times (man plus pig))                NIL
;; invalid operator           (3 + 2)                                   NIL
;; abomination                (fifty-five * (iron plus pen))            NIL
;; recursive                  ((1 plus 3) minus 3)                      T
;; really recursive           (1 times ((1 minus 3) dividedby 3))       T

(setf empty '())
(setf ordinary '(7 plus 11))
(setf nested '(25 minus (17 times 12)))
(setf double-nested '(100 plus 200 dividedby (17 times 5)))
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
;; recursive                  ((1 plus 3) minus 3)                      T
;; recursive fail             ((1 plus) minus 3)                        NIL
;; really recursive           (1 times ((1 minus 3) dividedby 3))       T

(setf too-few wrong-operand-number)
(setf 3-wrong invalid-operator)
(setf 3-right ordinary)
(setf too-many '(too many voices in my head))
(setf recursive '((1 plus 3) minus 3))
(setf recursivefail '((1 plus) minus 3))
(setf reallyrecursive '(1 times ((1 minus 3) dividedby 3)))

;; numeric-operand-check test plan:
;; category/description       data                                      expected result
;; -------------------------------------------------------------------------------------------------
;; empty expression           ()                                        NIL
;; no valid operand           (man plus pig)                            NIL
;; first valid operand        (2 plus pig)                              NIL
;; last valid operand         (man plus 4)                              NIL
;; valid operands             (2 plus 4)                                T
;; recursive                  ((1 plus 3) minus 3)                      T
;; recursive fail             ((man plus) minus 3)                      NIL
;; really recursive           (1 times ((1 minus 3) dividedby 3))       T

(setf novalop '(man plus pig))
(setf firstvalop '(2 plus pig))
(setf lastvalop '(man plus 4))
(setf valops '(2 plus 4))
(setf numrecursivefail '((man plus) minus 3))

;; valid-operator-check test plan:
;; category/description       data                                      expected result
;; -------------------------------------------------------------------------------------------------
;; empty expression           ()                                        NIL
;; plus                       (2 plus 4)                                T
;; minus                      (2 minus 4)                               T
;; times                      (2 times 4)                               T
;; dividedby                  (2 dividedby 4)                           T
;; nonword                    (2 + 4)                                   NIL
;; what                       (2 car 4)                                 NIL
;; recursive                  ((1 plus 3) minus 3)                      T
;; recursive fail             ((1 + 3) minus 3)                         NIL
;; really recursive           (1 times ((1 minus 3) dividedby 3))       T

(setf plus '(2 plus 4))
(setf minus '(2 minus 4))
(setf times '(2 times 4))
(setf dividedby '(2 dividedby 4))
(setf nonword '(2 + 4))
(setf what '(2 car 4))
(setf valrecursivefail '(1 times ((1 minus 3) dividedby 3)))

(print "checker tests:")
(print (equal (checker empty) nil))
(print (equal (checker ordinary) t))
(print (equal (checker nested) t))
(print (equal (checker double-nested) t))
(print (equal (checker wrong-operand-number) nil))
(print (equal (checker non-numeric-operands) nil))
(print (equal (checker invalid-operator) nil))
(print (equal (checker abomination) nil))
(print (equal (checker recursive) t))
(print (equal (checker reallyrecursive) t))

(print "token-number-check tests:")
(print (equal (token-number-check empty) nil))
(print (equal (token-number-check too-few) nil))
(print (equal (token-number-check 3-wrong) t))
(print (equal (token-number-check 3-right) t))
(print (equal (token-number-check too-many) nil))
(print (equal (token-number-check recursive) t))
(print (equal (token-number-check recursivefail) nil))
(print (equal (token-number-check reallyrecursive) t))

(print "numeric-operand-check tests:")
(print (equal (numeric-operand-check empty) nil))
(print (equal (numeric-operand-check novalop) nil))
(print (equal (numeric-operand-check firstvalop) nil))
(print (equal (numeric-operand-check lastvalop) nil))
(print (equal (numeric-operand-check valops) t))
(print (equal (numeric-operand-check recursive) t))
(print (equal (numeric-operand-check numrecursivefail) nil))
(print (equal (numeric-operand-check reallyrecursive) t))

(print "valid-operator-check tests:")
(print (equal (valid-operator-check empty) nil))
(print (equal (valid-operator-check plus) t))
(print (equal (valid-operator-check minus) t))
(print (equal (valid-operator-check times) t))
(print (equal (valid-operator-check dividedby) t))
(print (equal (valid-operator-check nonword) nil))
(print (equal (valid-operator-check what) nil))
(print (equal (valid-operator-check recursive) t))
(print (equal (valid-operator-check valrecursivefail) nil))
(print (equal (valid-operator-check recursivefail) t))
