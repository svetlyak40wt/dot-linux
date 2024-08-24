(in-package #:stumpwm)

(defun which (program)
  (zerop
   (nth-value 2
              (uiop:run-program (list "which" program) :ignore-error-status t))))
