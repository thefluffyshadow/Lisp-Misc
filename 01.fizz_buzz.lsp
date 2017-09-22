;; Zachary Champion - CS 3210 - Fall 2017
;; =================================================================================================

;; fizz_buzz function:
;;    Outputs a list of numbers from 1 to 20 with the following additions:
;;    If the number is divisible by 3, output a sublist containing the number and the word "fizz".
;;    If the number is divisible by 5, output a sublist containing the number and the word "buzz".
;;    For those numbers divisible by both, the number should be followed by "fizz" and "buzz".
;;    The result should be one long list.
;;    Parameters: None
;;    Assumptions:
;;       * All data used by fizz_buzz is inside the function.
;;       * The list being operated on is purely numbers because it is defined in the problem specs.

;; recr_fizz_buzz function:
;;    Takes a range of numbers and recurses along it, processing the numbers with proc_num.
;;    Parameters: range_list - a list of numbers
;;    Assumptions:
;;       * The range will consist only of numbers.

;; proc_num function:
;;    Takes a number and processes it according to the following:
;;    If the number is divisible by 3, return a list containing the number and the word "fizz".
;;    If the number is divisible by 5, return a list containing the number and the word "buzz".
;;    For those numbers divisible by both, the number should be followed by "fizz" and "buzz".
;;    Parameters: num - a single number
;;    Assumptions:
;;       * the number parameter cannot be anything but a number.

(defun fizz_buzz ()
   (recr_fizz_buzz '(1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18 19 20)))

(defun recr_fizz_buzz (range_list)
   (cond
      ((NULL range_list) nil)
      (t (cons (proc_num (car range_list)) (recr_fizz_buzz (cdr range_list))))))

(defun proc_num (num)
   (cond
     ((not (numberp num)) nil)
     ((= (mod num 3) (mod num 5) 0) (list num 'fizz 'buzz))
     ((= (mod num 3) 0) (list num 'fizz))
     ((= (mod num 5) 0) (list num 'buzz))
     (t num)))

;; Test plan for fizz_buzz:
;; Category/Description   Data   Expected Result
;; -------------------------------------------------------------------------------------------------
;; <No Parameters>        N/A    (1 2 (3 FIZZ) 4 (5 BUZZ) (6 FIZZ) 7 8 (9 FIZZ) (10 BUZZ)
;;                                11 (12 FIZZ) 13 14 (15 FIZZ BUZZ) 16 17 (18 FIZZ) 19 (20 BUZZ))
;;                               |<--------------(One list shown over two lines)--------------->|

;; Test plan for recr_fizz_buzz:
;; Category/Description    Data           Expected Result
;; -------------------------------------------------------------------------------------------------
;; empty list              ()             nil
;; singleton               (1)            (1)
;; singleton 3             (3)            ((3 FIZZ))
;; range                   (3 4 5 6)      ((3 FIZZ) 4 (5 BUZZ) (6 FIZZ))

(setf empty '())
(setf singleton '(1))
(setf singleton_3 '(3))
(setf range '(3 4 5 6))

;; Test plan for proc_num:
;; Category/Description    Data           Expected Result
;; -------------------------------------------------------------------------------------------------
;; empty num               ()             nil
;; non-processed           1              1
;; processed 3             3              (3 FIZZ)
;; processed 5             5              (5 BUZZ)
;; processed 3 & 5         15             (15 FIZZ BUZZ)

(setf non-processed 1)
(setf processed_3 3)
(setf processed_5 5)
(setf processed_3_5 15)
