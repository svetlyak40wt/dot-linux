(in-package #:stumpwm)

;; NOTE: Use standard (find-matching-windows props all-groups all-screens)

;; (defun window-cls-present-p (win-cls &optional all-groups)
;;   "Tell if a window (by class) is present"
;;   (let ((windows (group-windows (if all-groups
;;                                     (current-screen)
;;                                     (current-group)))))
;;     (member win-cls (mapcar #'window-class windows) :test #'string-equal)))


(defun run-or-raise-prefer-group (cmd
                                  &rest query-filter
                                  &key
                                    class class-not
                                    instance instance-not
                                    type type-not
                                    role role-not
                                    title title-not)
  "If there are windows in the same class or role, cycle in those. Otherwise call
run-or-raise with group search t.

   Sometimes you might prefer role to class, because, for example,
   for Firefox class will be \"firefox\", and role will be \"browser\".

   Note: Use show-window-properties command, to determine window properties
   before using it as a filter for run-or-raise:
"
  (declare (ignore class class-not
                   instance instance-not
                   type type-not
                   role role-not
                   title title-not))
  (cond
    ((find-matching-windows query-filter nil nil)
     (message "Searching ~S at current group"
              query-filter)
     (run-or-raise cmd query-filter nil T))
    (t
     (message "Searching ~S in all groups"
              query-filter)
     (run-or-raise cmd query-filter T T))))
