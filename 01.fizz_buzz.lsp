;; Zachary Champion - CS 3210 - Fall 2017
;; =================================================================================================
;; fizz_buzz function:
;;    Outputs a list of numbers from 1 to 20 with the following additions:
;;    If the number is divisible by 3, output a sublist containing the number and the word "fizz".
;;    If the number is divisible by 5, output a sublist containing the number and the word "buzz".
;;    For those numbers divisible by both, the number should be followed by "fizz" and "buzz".
;;    The result should be one long list.
;; Parameters: None
;; Assumptions:
;;    * All data used by fizz_buzz is inside the function.
;;    * The list being operated on is purely numbers because it is defined in the problem specs.
;; Resources Used:
;;    * for range function: `https://stackoverflow.com/questions/13937520/pythons-range-analog-in-common-lisp`

(defun fizz_buzz ()
   (defun range (max &key (min 0) (step 1))
      (loop for n from min below max by step
         collect n))

   (defun recr_fizz_buzz (range_list)
      (defun proc_num (num)
         (cond
           ((= (mod num 3) (mod num 5) 0) (list num 'fizz 'buzz))
           ((= (mod num 3) 0) (list num 'fizz))
           ((= (mod num 5) 0) (list num 'buzz))
           (t num)))

      (cond
         ((NULL range_list) nil)
         (t (cons (proc_num (car range_list)) (recr_fizz_buzz (cdr range_list))))))

   (recr_fizz_buzz (range 21 :min 1)))

;; Test plan for fizz buzz:
;; Category/Description   Data   Expected Result
;; -------------------------------------------------------------------------------------------------
;; <No Parameters>        N/A    (1 2 (3 fizz) 4 (5 buzz) (6 fizz) 7 8 (9 fizz) (10 buzz)
;;                                11 (12 fizz) 13 14 (15 fizz buzz) 16 17 (18 fizz) 19 (20 buzz))
;;                               |<--------------(One list shown over two lines)--------------->|
